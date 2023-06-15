Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8777316AC
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 13:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554AD10E4E1;
	Thu, 15 Jun 2023 11:31:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7612B10E4D1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:38 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b44200367bso11852381fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828696; x=1689420696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+HIhvOoQ0TWNFRCD6jSrp6XPbshCV+o8gS0gvm0cA9c=;
 b=codcU07VH/1l08yBIe8moRDqekQ+qa9MA24meplrjB/GfjiERlvYVyBtjKgqtGTcSm
 VINdEP3TNkQnD9GbpHjYkEiITOCr/EbeGdP2Mm+wassaHN5acrruRQFAVkMF4I0qmwBD
 d2PFSC7IRgnox6FKWApbOQbFYetb9QuMYt1jHgXN4OOVtppIAsyyefh0YgWDekvLngVY
 UUX0o7ZHBzhMqIod1PN5WmAYwr0XlzjJss1yLK71gHsSORVvLD3fMB3w8okLT9PL7+pS
 KOHDWis+GoihcNcIdSKhnpM3k8odHTEvpJ9GzwOkCNH7GCMIMQAYGBCEWQw/PaCFpkOh
 F6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828696; x=1689420696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+HIhvOoQ0TWNFRCD6jSrp6XPbshCV+o8gS0gvm0cA9c=;
 b=dKbgdqH3VvITsCFJIL9Nf4JIpK/x2Fr1P6VW/r4O6LxQ4UQLP82/gWc5w8ZfIw+BKx
 YmFUGA0bcQZlZMfRd9wrW9YBSRWlVaZScmrv0QUUV48jdAucTBLKAqDV4L/8jHF2EgoX
 ghueZz/gYz2pN6RTwR8MFlaZpuDW+AspQirutSaHx4muemwCX33pwUlgx3HoxP0/gfEE
 2yMcEJnp/WoDy0ILs5eqIuh1gLABPFuUGNPpKmGIYyh6BOL/CcAxv2ERvFkqUsZhLg7X
 IwOE1c4+U3o67QmbQhE/sHQ+DlJyvxy0BskRvjLhvhyYozdiBcsT/AGGY0d5F+D3ttls
 WugA==
X-Gm-Message-State: AC+VfDwIY1gIZPlBpoyOCWljXBOLl5PYal6gkg/bsUkvYcOtMBlIpLlp
 DLudSQoDkUMMTfy6Al+PuDp9l7CjORflCHFMQdg=
X-Google-Smtp-Source: ACHHUZ7SSADcaAPRP5KYn2CMl2Rq1NcPT9lS6upii8Us8pO9C2lbr1tZ4cZdHrkss8uyf21GnV3qJQ==
X-Received: by 2002:a2e:95d2:0:b0:2b1:daca:676f with SMTP id
 y18-20020a2e95d2000000b002b1daca676fmr8191322ljh.36.1686828695949; 
 Thu, 15 Jun 2023 04:31:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 15 Jun 2023 14:31:25 +0300
Message-Id: <168682860388.384026.1953512234094498484.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v14 0/9] Introduce MSM-specific DSC helpers
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 24 May 2023 10:45:13 -0700, Jessica Zhang wrote:
> There are some overlap in calculations for MSM-specific DSC variables
> between DP and DSI. In addition, the calculations for initial_scale_value
> and det_thresh_flatness that are defined within the DSC 1.2 specifications,
> but aren't yet included in drm_dsc_helper.c.
> 
> This series moves these calculations to a shared msm_dsc_helper.c file and
> defines drm_dsc_helper methods for initial_scale_value and
> det_thresh_flatness.
> 
> [...]

Applied, thanks!

[1/9] drm/display/dsc: Add flatness and initial scale value calculations
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7df1ed6ddf3d
[2/9] drm/display/dsc: add helper to set semi-const parameters
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e871a70d8ccd
[3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/688583281241
[4/9] drm/msm/dsi: use DRM DSC helpers for DSC setup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/49fd30a7153b
[5/9] drm/msm: Add MSM-specific DSC helper methods
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b50f06f83e0e
[6/9] drm/msm/dpu: Use fixed DRM DSC helper for det_thresh_flatness
      https://gitlab.freedesktop.org/lumag/msm/-/commit/44346191a210
[7/9] drm/msm/dpu: Fix slice_last_group_size calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c223059e6f83
[8/9] drm/msm/dsi: Use MSM and DRM DSC helper methods
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ed1498f77419
[9/9] drm/msm/dsi: update hdisplay calculation for dsi_timing_setup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/149419396a92

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
