Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02929EC870
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 10:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB3110EAD2;
	Wed, 11 Dec 2024 09:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m9WTlTne";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0E10EAD7
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 09:08:49 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4361d5dcf5bso4841535e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 01:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733908128; x=1734512928; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9vEtBjFWv0oJ9eIaHpJrX0BFB+4qp8phO4ofGzRE0Nw=;
 b=m9WTlTnerA/rr5OuHyqW60qnb4eKtj+T1YJGi7OUSZT/0UxuX4xV9MMUQYoMIYI5Bt
 QiqEPJdKEzBRbs3/00fKWwSYAUgfnNP5vajlNBrZ8twpg3LWvUMxo68wUZSfZHB9XYuN
 JAZ0al7NYCAD6XZ4a5Q9a2PMsMYAyOS6vMLR6YRwrFSvnUyM1+Zp8f/pZzkDRYTqFQbi
 0bZarWkKHRF+qRx7TygkGvj50Ykl8vHIV2U1QTUhhvl6iK9ABd6mudUL788dodFcHSOM
 eyq63ogNqXfqSRltb9HbwVxZ8j1GUOdFo0K9ovJ5b2Js76TPlHjUiZ1TzK4Z/GbpoybP
 or7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733908128; x=1734512928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vEtBjFWv0oJ9eIaHpJrX0BFB+4qp8phO4ofGzRE0Nw=;
 b=pKi2FcFgcmAs9PdpwUyY7m4yr8/iLMKTBQluE9pXC2ODShv52qQSfs6Ob1zKbATa0K
 nPhrRRk0DmRniLNhrMIfPeAe0ISV4DAlNa3eShD1ebqveB8NSoUx/P8RcmTKXlej1o/A
 Uwkx+1kTnHFW199oEx1WPjJGmzBDWY6Szi3wkbEIpuHzTFOsrWo1Yr1PSfLCBR7526DY
 mvmkhatYL539j0qOAnonRHQqzl9MnKB9ub8ALhELyPJycmmmUNuso10LHwzvMrjIHDHA
 KjTGe9MLrJo1euY9wX7VVV3O4XML6jAAR+faxJRs0zzsa2yO7n7xdVU3449Csa+WnvWb
 1Uew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaMWGCdKQe/5B4nxh/tnKCMyrFJeCqFCoQpz5Ng5wc3C3O4SJChilaZ6IV/dO4cTpV5jkm560xj/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVouRSQuJa+15JPiYCikMHO/l80po1i53Pxs/6M4+jE+ibWViu
 5IqZlJUHZ3AQstrA13P7X9qabRaj4DpBfzPX18lyKxA4a0vQ2G8x48RGMfmi80E=
X-Gm-Gg: ASbGncu8Fg6x+uQRNLK1Rvxbbo3egfnHZJxDLQl/wsN+o7aMXCdd7ugwxg00E7y8X9i
 QA6hFXnVDvtGOCIGRzAoeXCq4MYOoCfJ+7Rct4nvODxlYRt4ObsQGxpLx39S60yQyuTcQ6Rbcmp
 4rtUsm4dKZDEWkT63i4gUUvGM2SRlqvES/obHWnQ8eRZo5UZISzsZBH8v7zqGrqdIQ0XsEaEKsV
 2mMeW3yxOInefpZvJ1GpAFqcL4WxDWE6Zl30HYSgNWQLz9kx30k
X-Google-Smtp-Source: AGHT+IGD0J/JRFizsjyOq9cq12J2ujkcAmyNKzRhsrMcAI97nrwbSWWcCwaN8qi6JkWUTmtl0C7NHQ==
X-Received: by 2002:a5d:64cf:0:b0:385:ec8d:8ca9 with SMTP id
 ffacd0b85a97d-3864cec5b76mr1446900f8f.42.1733908127884; 
 Wed, 11 Dec 2024 01:08:47 -0800 (PST)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a4815sm807610f8f.26.2024.12.11.01.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:08:47 -0800 (PST)
Date: Wed, 11 Dec 2024 11:08:45 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/4] drm/nouveau/dp: Use the generic helper to
 control LTTPR transparent mode
Message-ID: <Z1lWnY+TxSptkBiY@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
 <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>
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

On 24-10-31 18:44:55, Dmitry Baryshkov wrote:
> On Thu, Oct 31, 2024 at 05:12:46PM +0200, Abel Vesa wrote:
> > LTTPRs operating modes are defined by the DisplayPort standard and the
> > generic framework now provides a helper to switch between them.
> > So use the drm generic helper instead as it makes the code a bit cleaner.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_dp.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > index bcda0105160f1450df855281e0d932606a5095dd..80264e6186246903fa037861fe37493646de0c6e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> > @@ -80,15 +80,12 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
> >  		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
> >  
> >  		if (nr) {
> > -			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -						DP_PHY_REPEATER_MODE_TRANSPARENT);
> > +			drm_dp_lttpr_set_transparent_mode(aux, true);
> >  
> >  			if (nr > 0) {
> > -				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
> > +				ret = drm_dp_lttpr_set_transparent_mode(aux, false);
> >  				if (ret != 1) {
> > -					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> > -								DP_PHY_REPEATER_MODE_TRANSPARENT);
> > +					drm_dp_lttpr_set_transparent_mode(aux, true);
> >  				} else {
> >  					outp->dp.lttpr.nr = nr;
> >  				}
> 
> Could you please extract this true-false-true dance to a new helper too?
> This way Intel driver can use the simple helper, the rest of the drivers
> can benefit having the common code.

Will be part of the new version.

> 
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
