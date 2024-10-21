Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC39A67D0
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 14:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4425E10E4B1;
	Mon, 21 Oct 2024 12:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vKsk0B4M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A924C10E4B4
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso4402807e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513069; x=1730117869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PZF/QY6lgKCZozlrE12q9Y4uQ6tVQUtMhzEdEOTrjAI=;
 b=vKsk0B4MIGziCkRykJddcegct4DRYeOI4M2umL6EPVbxGDQwwoxr018nSjR2YFEPrC
 4pyoJTSekwH2HL0qlmV6SQfDwVja07LDkfPbvDiVPyXRwqK1Osxmuu6sFV6glIJBLmY1
 Dc6ySBKr+a32j3eU3Efoo8VRhvg2XWpMP2GjvjQxdmgwYBK0D5LKGRJ9qhoDu2O6bPHJ
 1KFvJR+H0zaimKcsK5j1b6eZ0TsScAdF13BkMTkpu4f8+1Bxleo6o/wwU7rnpm9JE0Na
 EALKPLgRrXl8v82dp6fiVufSPz1j3KaJ9O5IkONJub5kpr/ZWPtG2hMTmgtNqgJX3qFx
 49cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513069; x=1730117869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZF/QY6lgKCZozlrE12q9Y4uQ6tVQUtMhzEdEOTrjAI=;
 b=C1gHQpPn8daydAtyP2bAtq3Eq6P/hqQUJv63K23/Fu3qi7HR/9Avj7hTrV1hhK8Bgw
 tqEkdClGUtQdZJZGnjNlKXpxWy1q+jGhviQazRguQArK68eVgtIxy4x/+Lcw1vlxPy7t
 fkK7KtubkCE76zhIwFO0Qjmeq6c++uNyKxDY+qrtj/zWfoQwZHHGjjiAsjBxTFWGOWCZ
 fskTd0vrtJV3etoun7E6H5psx5aZ2unxkLxYkdD0jAU/8Rp/XuQtJjV3tV9p9zwNUMvX
 a2iNlPn+ccfr3rUSrFWa4b29RJWdV+K/WN8ozPWw97X3JeMFgiOHrhRmSU7HhcG1oaey
 GqcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQEC5/8IsHK8m93FzvuiodimmHQpRHgYnjicNNCQizNnvC4KNVGPM9GjDQ1e/9pAxn2o9lFho1Mqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRx5guPvZOpjkGiew9J0e9cgMwP2D3iwRVqOP0sSdovYhFipNX
 sx8SsT1rRn9N0/WjOBWiu8p8dATKVa7sONyD/Ag6YOEsnX694Te/x7hUq1dcakw=
X-Google-Smtp-Source: AGHT+IEp7b9dHlvPptGyKtr826kptA0YP++LFaH82xrCED22x7jik+ibY/CFrIq5TZveCAvHnhMo+A==
X-Received: by 2002:a05:6512:1584:b0:539:f84d:bee1 with SMTP id
 2adb3069b0e04-53a0c6dbb2amr5752157e87.17.1729513068790; 
 Mon, 21 Oct 2024 05:17:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [PATCH 0/3] drm/msm/dpu: catalog fixes for SDM845 / MSM8998
Date: Mon, 21 Oct 2024 15:17:38 +0300
Message-Id: <172950935861.2053501.17445989059295810521.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
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


On Thu, 05 Sep 2024 06:26:12 +0300, Dmitry Baryshkov wrote:
> Drop two extra blocks that sneaked into SDM845 and MSM8998 catalog
> declarations.
> 
> 

Applied, thanks!

[1/3] drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
      https://gitlab.freedesktop.org/lumag/msm/-/commit/768a272d5357
[2/3] drm/msm/dpu: drop LM_3 / LM_4 on SDM845
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d39271061d67
[3/3] drm/msm/dpu: drop LM_3 / LM_4 on MSM8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c59afe50773d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
