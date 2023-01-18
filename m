Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E36710B6
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748C010E644;
	Wed, 18 Jan 2023 02:06:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8580510E63C
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:35 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id kt14so20933643ejc.3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ccs2uNmfL4XWxTk6Uww2FXDm1/IOKWoamNzZVTFZBqg=;
 b=q0tgw2Z3ChWeUnJns+bg5UgV2wpIPe+4eymySGOiHe2x8bWtkliFGdMYtXQaWkZswx
 S3EMetxLLkpwji26+bXSC2li2MMmLZhSH9wmSbHRXNqEok04ZvgGq+CvARGESzELQUXx
 U3oU4cYAXc3PUHbIMsQJIdkyb2+EkKaBW20XfCBmjJSJUcCqXq3GJl27GlKFBfe7Nte2
 njxKegVK7aDJrdvorZauNZ2IZfj1Om09bcscX3FtlzAoQhsrv7Qm1PR/CEifaH5ytcee
 It51XGWjj2V689CLcxbjyPHfvozsVm0TqPha4rthQO0rrmbiEmxnmt0KR+U/z5DdaryE
 +2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ccs2uNmfL4XWxTk6Uww2FXDm1/IOKWoamNzZVTFZBqg=;
 b=h6bE5H1kGzlPdZcC6SPJZ7WDj1eyztTHzvQR5wQKIDRBJzWKbrqwI/dJYz8KZ3tyLb
 RwtWMHzPAcnI2MbHQwISe7uqhtDa+MSPeARY84YD6P/94kqKbE6Oy2Gvj9ku/QN0Gl/m
 P8nEvtDkGU/SyPRVKjp0NXhk5cH88VTl15QlKFlx5R2qNPvdxJotvEL8tpRZlCoScCi3
 z9uZf/wQ46hxC8T5vx4+JpT0oHLniQuqEGNePfYMVN5//qpha8W0F5j/KswAv0r+jCjO
 it5G9/NEf1u+xeTXSpyaZ1u1Yt4X1biZxStYD/RowP/+dhvcMM3pzOYiJlc6gLK8Gleu
 oNpg==
X-Gm-Message-State: AFqh2kon2S/J33aHj939Ub5/XsCvkBldFuIAos1s2tuF9Zl0EmQoRyZo
 4mPUJSc9KRKKLH4EaTntIVVUCw==
X-Google-Smtp-Source: AMrXdXsS/dgY9e1GCBLOxP9hWlAxvr+wHa+R2wVZqHJzPgT5Z0EN6+R2fGy0/ziBt9AZuquxi3TPDA==
X-Received: by 2002:a17:907:86a5:b0:870:d4f3:61b3 with SMTP id
 qa37-20020a17090786a500b00870d4f361b3mr6574435ejc.12.1674007594143; 
 Tue, 17 Jan 2023 18:06:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: d-gole@ti.com,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Date: Wed, 18 Jan 2023 04:06:15 +0200
Message-Id: <167400670539.1683873.10074210279726951946.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110021651.12770-1-jiasheng@iscas.ac.cn>
References: <20230110021651.12770-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dsi: Add missing check for
 alloc_ordered_workqueue
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, robdclark@gmail.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 10 Jan 2023 10:16:51 +0800, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Add missing check for alloc_ordered_workqueue
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e5237cd6ad68

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
