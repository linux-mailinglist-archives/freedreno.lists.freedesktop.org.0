Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6838022CA
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145D010E272;
	Sun,  3 Dec 2023 11:26:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C6210E10A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50be9e6427dso936093e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602794; x=1702207594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vrRnlK++TVk2VT6FeBO/PnYsSt3drwvKoWii9XeVnc=;
 b=cSgnCHK1jRNbuPFXK0fZ9RpHL+SN2UIu/OKYA+TvS9pt2+vw/rn3hFqmDWEwfi4Spt
 YyphwnFdefMh7wgxC+nCdwE3zd2+q2DtgdWK2mgTGmzsEd1EZJf4SvbVaZzFEUt4cmSw
 WxG/r8b/xRRc1y2hpEInJkWeQCfScCCIjsMpgnc21kRuIRoQePDhsD4v1yexkdzdE+F2
 soMic5Rre/Vc0OfLQEMkjg9GedhBShZ6JV6ZIweUMoPiMAe3nKbAfckNHsNX0OwYmENU
 d+OGO/ROL52H96lpFIJdsCZSbSqKGi64I4aJyCpFpE378wHFhbDEeD4wFJMhpiwPPm/X
 X0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602794; x=1702207594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vrRnlK++TVk2VT6FeBO/PnYsSt3drwvKoWii9XeVnc=;
 b=h1827DOgebvnmpqv1PLlM0tXTYWUCXjeWO/y9fVRl1ReIoqxIz5pU19yx/4PpgBf7j
 nUyU+bAhB4cm++IAcoCIcGISqKomF/4B3IG2RkLYqIf2jxUtkCrFk9m+Eyf68hsQqGMZ
 iqXARgnYxsHEUyfzTnG2B5LlK/4PGaD4tJAaUyvgLgm14ZCJHM7V/a+Q5ii5szb5OLwU
 3z/st0EpAnDOZOLgSLyaRWtb3vQi0wR7a1i/GkGw7st5xm9SkUvAUtDL74J95uxJdAK1
 FvDfzpdYaPxLkPHLhZobNYClSASLLWzkik72nS6FU9ESJm5XvGPpKNA/NpYmMddF4rh2
 mzrQ==
X-Gm-Message-State: AOJu0Yw2kEEFBNvwm4fSKex9/CjX/jnTY8Haq0tLh/5Th+CLh8z/tD3M
 cT4RrPMGfcKSr8joRgxUjhierg==
X-Google-Smtp-Source: AGHT+IF8VFE8yHqpdA0lL2rONweKN2YoaaNJYPbP1H/4L8xmGbnzoQjpJq+kMoolwog2wQ5Wm5dbeg==
X-Received: by 2002:a05:6512:6cb:b0:50b:e427:a530 with SMTP id
 u11-20020a05651206cb00b0050be427a530mr1343544lff.34.1701602793929; 
 Sun, 03 Dec 2023 03:26:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun,  3 Dec 2023 14:26:18 +0300
Message-Id: <170160265545.1305159.2501271853192928734.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 00/17] drm/msm/mdp[45]: use managed memory
 allocations
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sat, 08 Jul 2023 04:03:50 +0300, Dmitry Baryshkov wrote:
> Follow the DPU patchset ([1]) and use devm_ and drmm_ functions to
> allocate long-living data structures in mdp4 and mdp5 drivers.
> 
> [1] https://patchwork.freedesktop.org/series/120366/
> 
> Dmitry Baryshkov (17):
>   drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
>   drm/msm/mdp5: use devres-managed allocation for configuration data
>   drm/msm/mdp5: use devres-managed allocation for CTL manager data
>   drm/msm/mdp5: use devres-managed allocation for mixer data
>   drm/msm/mdp5: use devres-managed allocation for pipe data
>   drm/msm/mdp5: use devres-managed allocation for SMP data
>   drm/msm/mdp5: use devres-managed allocation for INTF data
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
>   drm/msm/mdp4: use bulk regulators API for LCDC encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
>   drm/msm: drop mdp_get_formats()
> 
> [...]

Applied, thanks!

[02/17] drm/msm/mdp5: use devres-managed allocation for configuration data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/062aeadeba1d
[03/17] drm/msm/mdp5: use devres-managed allocation for CTL manager data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4c1f4c1f1b43
[04/17] drm/msm/mdp5: use devres-managed allocation for mixer data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1ad175c2c884
[05/17] drm/msm/mdp5: use devres-managed allocation for pipe data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/323e9a18d6e1
[06/17] drm/msm/mdp5: use devres-managed allocation for SMP data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/531d5313d934
[07/17] drm/msm/mdp5: use devres-managed allocation for INTF data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6de8288bf668
[08/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6f235e3d6b18
[09/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/669afee4a17e
[11/17] drm/msm/mdp4: use bulk regulators API for LCDC encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/54f1fbcb47d4
[12/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/783ad6e6312f
[13/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e79571e8708b
[14/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/93d6e1b82b93
[15/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2c24668cc068

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
