Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD79EA0CD
	for <lists+freedreno@lfdr.de>; Mon,  9 Dec 2024 22:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8510E7E7;
	Mon,  9 Dec 2024 21:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SGN/XvUn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33A610E7E7
 for <freedreno@lists.freedesktop.org>; Mon,  9 Dec 2024 21:05:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54024aa9febso483118e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Dec 2024 13:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733778334; x=1734383134; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hbwD0xdtFeO2X81Q2PXEiGy5cSfyM0/IvSDcuNaHUrA=;
 b=SGN/XvUniupNkXtKK8OAKWO8Vo30dxW387V1xKoOZWDd13eCRMe94/yofWN1Yllb5H
 AIuBJRub84y05PCfmqqZObCUs7Kyg6lDxV5iYIBwgOHsaV3wwI4dwvMt9mQLk8kcuvy4
 KqOwiXl/3VJqKfmAUIru0C1jzF8hun7CjvRtMT0QprW13663457Y1Vrx9pPftFgkTfLf
 RsEN2qCA9fYAicpjkSIx+G/IM079QorZRCCckslrvDyCVyd010GkECNtYT/EultRiJkZ
 sGgl/G2mXAHaHW7jhxddBcB9gkRgmzVp3fiK0SDD/freGb76vUTmSRbjC+WG/Ai2/wij
 ncAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733778334; x=1734383134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbwD0xdtFeO2X81Q2PXEiGy5cSfyM0/IvSDcuNaHUrA=;
 b=dV79O+OXDMx7+Em6OMEX37Cz0AUKdU617V1JVlj99A87vlYw9WtMxLcPr3XXkpWscj
 YCS1wrTxgu6Jt2ydJpiAHX8ZeU+5dKa1fPZMk46UbphHOrIlGB3oCz9H1Kmm0pT9N0p3
 w4wcC+YXOZ3L34JybBRev2xAqLUF2RkkG2Zq3wxveqcQTUrEpBXxJ+qv2fUJEZbOOCSO
 hImTqHbOhJ7vlK6lHQlUiEsKIKy66VhUpaAjaPGFek93c6Asyj2glXDH1MCGQjgO8IvG
 d3SypyeN+7LoCTyuKvFs0K2i2IpEr0pSPZyXcjTMT7NVEJAoYVAd9Y48DRZDMFrWWZGA
 K+FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHrU+AgrH4Rg9dNjUAFVHz0rOyo/OgogqX7SsUllMtgxpFYl4xbLHBwL7bExUh8Mb6OPvQhmdB1bc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC/nTlak14yMA5pfGuk9gGLyeWJ1gCTMRiyxr1Ay5xCp75xBJ5
 UpUoBnxyYQfCW8qxjJyuWaXwv0MzSwxgYMq/f7L07LLgg0UbFffdCOb3oSZX/M4=
X-Gm-Gg: ASbGncv92vPY2QkRliyTM2IwMgDZlv7JRd6FvFj2TA5Ha7NU2QT0nmOBHigJlhrZLch
 gYqibCBI4iALyqN7qtds6Zh6YosrT2OUGm/AZXdw+0oGyumVLTCP5Pln5acGVnLuPpGg3hhVs28
 IV8FbfV8OOgNUePC8DUdTewcJVGCC070O4p98ezn5l9pNrUMuWervHrm9HJu8CMEO+jhaSGDdv7
 /rmpT937UJImvrvt7cNalU0fNajp3sUHHr6ZKSPtojqvRjZRzZ6psPorymBi2/I/XYOAFpxYCE+
 HkRMDtlBwpDH2O0CgAdEywL0ckr5TQ==
X-Google-Smtp-Source: AGHT+IE63q6tbZgiYfnAuYiETrebmlUHAEwKw2EoVr6nHG3mwSFQhamy8uW4P5FHyhiMyHhSRBOR9g==
X-Received: by 2002:a05:6512:ad0:b0:53f:8c46:42c7 with SMTP id
 2adb3069b0e04-53f8c4643dbmr3412654e87.14.1733778334011; 
 Mon, 09 Dec 2024 13:05:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e34916befsm1095574e87.120.2024.12.09.13.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 13:05:32 -0800 (PST)
Date: Mon, 9 Dec 2024 23:05:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Message-ID: <jzbqtrhiebtb6oveg35b4cdu57epqattu5lqhtfhbzctomzhrl@vnl3vklpnvd3>
References: <20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com>
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

On Mon, Dec 09, 2024 at 12:15:57PM -0800, Abhinav Kumar wrote:
> On chipsets such as QCS615, there is no 3dmux present. In such
> a case, a layer exceeding the max_mixer_width cannot be split,
> hence cannot be supported.
> 
> Filter out the modes which exceed the max_mixer_width when there
> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> to return failure for such modes.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Note: this was only compile tested, so its pending validation on QCS615
> ---
> Changes in v2:
> - replace MODE_BAD with MODE_BAD_HVALUE to indicate the failure better
> - Link to v1: https://lore.kernel.org/r/20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f6ffd344693ecfb633095772a31ada5613345dc..87d76f388bef48c880ae70ddcdb76ccb0336ad32 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>  	int i;
>  
> +	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
> +	 * before even checking the width after the split
> +	 */
> +	if (!dpu_kms->catalog->caps->has_3d_merge
> +	    && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)

Excuse me that I didn't notice that earlier. && should go to the
previous line, not to the next line.

> +		return -E2BIG;
> +
>  	for (i = 0; i < cstate->num_mixers; i++) {
>  		struct drm_rect *r = &cstate->lm_bounds[i];
>  		r->x1 = crtc_split_width * i;
> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  {
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>  
> +	/* if there is no 3d_mux block we cannot merge LMs so we cannot
> +	 * split the large layer into 2 LMs, filter out such modes
> +	 */
> +	if (!dpu_kms->catalog->caps->has_3d_merge
> +	    && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> +		return MODE_BAD_HVALUE;
>  	/*
>  	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>  	 */
> 
> ---
> base-commit: af2ea8ab7a546b430726183458da0a173d331272
> change-id: 20241206-no_3dmux-521a55ea0669
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
