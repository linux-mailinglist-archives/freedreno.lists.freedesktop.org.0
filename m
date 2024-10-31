Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3A9B86E8
	for <lists+freedreno@lfdr.de>; Fri,  1 Nov 2024 00:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6BE10E0B4;
	Thu, 31 Oct 2024 23:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w7KuAx28";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E9D10E0B4
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 23:17:48 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb518014b9so12400681fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 31 Oct 2024 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730416667; x=1731021467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frsp46Okfb5QiVmFNAXVWYtRI09WjPuac7vIqiSQUO4=;
 b=w7KuAx28uLdWO47wDKvDNVr3XjkKX5mVHlvzqACWtalo8KNkxnA+YshkVi+QdCWIMI
 Fblms4H+ZoF7qZp8J4/XuREoLTSsFxnYzPdq1nz1fnaglDgomSdgITsCiyxmRDXE3YRq
 wJqmggdgZs3hYk4a4ZXzQ9h+IYz/g4DtjwL3nQpMiG7tH+wAqYuVxob93ZJSbk4IZWYo
 tyDAT/zIj9RH31EFoWDvENRsDAaYOjht+dxgNXhDZvCRAB4/m3b7RYQq4sDRAcfmECQF
 THeeizzTGK9a/ygtMCH2QcSN9YPLOldl78KPd4CQbPuUf2OJEDYgB3u4SUZbpJ3cN8pm
 hFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730416667; x=1731021467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frsp46Okfb5QiVmFNAXVWYtRI09WjPuac7vIqiSQUO4=;
 b=tM/Pf00j3JT8kQvFamckJtMRckVus87FAXGIpcF4LJKQlvLIybskFASr88/+O6q3DR
 LqkJhRcSd/KUskBhYYsR1aJy3yGENSXmop9poV27GY3dBgiqyrBZ8fDDIHOTcKcrmQTp
 3JDe5BEzh+iLqVdnO6wkZBi6k6lccrcikUesnNuxNyvmSlzAurC9SqV8nVSoBS3PKb0e
 NI2b8jkvD2Rj+uQS+LEW9giRH1mKcZXkkFaulpuhGraF9r9sYRmS+VfkuzW/cq3MmhYW
 iFE82QML0xNPhCJ1/pUev0pOoKab2y3naZFGZ/L0dHXXrczMTySZwSUkdGWTLDSEAskw
 OeWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxbZNNq9qPs7Ued+OVbJ7FQTitF967lxOYDPVw8I6hfVl+GiSwHVjIacoI0skAfmT5CPf5DKCIptY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT4pn/H9a506aQYFIpHTQ3GyMKt8ay7FheYs46j5obu/sJ5lTq
 QaWfygFUVuXvs0RLPnOmfk5r1SsyIh6FNH3bAL9ZDq2LuHBEG9fDHCgP5YSn5xE=
X-Google-Smtp-Source: AGHT+IErIn+8tk3gc2319GvFqnOquZWc1mPt8zpg0mrwwWOluM01t+jVj4/jowjH3KFQAqp0pQvtuw==
X-Received: by 2002:a2e:5109:0:b0:2fb:4428:e0fa with SMTP id
 38308e7fff4ca-2fcbe04f435mr79462881fa.36.1730416666587; 
 Thu, 31 Oct 2024 16:17:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef617ad0sm3536041fa.67.2024.10.31.16.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 16:17:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm: minor msm_drv.h cleanup
Date: Fri,  1 Nov 2024 01:17:41 +0200
Message-Id: <173041664077.3797608.17754324846652823290.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 31 Oct 2024 23:44:05 +0200, Dmitry Baryshkov wrote:
> As I stumbled upon msm_display_topology define, perform minor cleanup of
> msm_drv.h incldue file.
> 
> 

Applied, thanks!

[1/3] drm/msm: move msm_display_topology to the DPU driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f8706bff68cb
[2/3] drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/858b64e21217
[3/3] drm/msm: drop MAX_BRIDGES define
      https://gitlab.freedesktop.org/lumag/msm/-/commit/26d841fd1c15

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
