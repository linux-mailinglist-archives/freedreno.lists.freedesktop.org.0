Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A59FCB13
	for <lists+freedreno@lfdr.de>; Thu, 26 Dec 2024 14:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB3610E06B;
	Thu, 26 Dec 2024 13:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gl29Q2Gg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB4810E06B
 for <freedreno@lists.freedesktop.org>; Thu, 26 Dec 2024 13:07:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso63461595e9.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Dec 2024 05:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735218451; x=1735823251; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2xYN5a7hOoppgoAE3bkR8Zunji5zT+kUi/AFcDG3CeI=;
 b=Gl29Q2GgjeMXIuTlwwk7TXmaNjV4vgFNQwRa0nx+vXumJn0W2Xr4U2aRrdar6u5N9d
 lN+SpzfmvFWJYu02X28HwM5rmU9gAKaQkNZaBXashyDaSKR8WqThcfdXoOJ+R7Urtp5k
 WnQ+UsQvMjkHpqTtkdDJ23L/BxJNMJQXTlj5Z9fLrrGjhR2haGgHxF0MYr4cAS7gif5U
 jzVAVD3O5LmcLbAx7slq53CpxrBZD+dtC7IVjvCOHsAuH9duOYcYLEB2eusQnV/HL7nl
 ZpqmweDCCf6VRNrYI6kk96MHmvx5YDKXDQcvvtL6Mps0f8tcul4xN0dfzLyamn0a6/aB
 vNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735218451; x=1735823251;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2xYN5a7hOoppgoAE3bkR8Zunji5zT+kUi/AFcDG3CeI=;
 b=q1L4oorG87KOwhpyFR51A1/8t8m4AeX7qlrUJSFRr3pDvD5PJ1OQuKOr2Si7XMp0PW
 UoZC7edocJ5O+leVlRAsdjkHil1OZpqTkuff31IAAQ3EEvn5e1MLjdV24ASCVf8V6/gK
 7ikFs+rF36U4u3snO88Vz7IZVRHpkhSBvHHjdDMQcgl8fk9H0/I/OSP4A8SLipCYHgFf
 mRTRgz5+oMtqSnx0khVbSdY+ux/0z8F1MbQtScgyGmrAEQlvIdzKilxZes+eKYmovXDa
 v/1wu5/whiO4WhTxMVYsHnnPKmFlFWxLhngfxUrSvW9FbyNNixIwyjgE3p+iF6tHtn18
 t5PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYpqL3G5Ap8jtp/GmX+IgrPvri/GrryQRZDYWNDy1lqIlbJaF5uCCjmGFlXphyYkapXz6xufQLLIY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwK/HwLDCaqV69Imb5mgdPzky6vxdkZqeaGtCH9hfDKB/QxLMyS
 hcY9tI1YkkMHD59+/nbnHvdfFywSSLk4KnRJOK0lG7WEfU6V+cr30MjljcSRuqE=
X-Gm-Gg: ASbGnctSgFk8aIzzgu5oLCv58dgJ4t7MNe0xzBsyMzSGstyzt9FBPtWOPNrFZaL3A7U
 8xwksPjP3HeT9kzUZFC6Q/nlRMftKsf5dZ4N6/nnjP3WAj64zRLS83K/zOESqJzr4A3eHT0zDP+
 UFKpS3wZHQGa/bnOlvLDjzMy+nLKT3Gj3eK+1av8eVDqO1VRgF/QOqCWzho4Yxk2e67Rn6Z/vKo
 L8uBJNaaKOPCfn5tYRPnLQpesPsyLzDEkUuRYFtB/Qmz+wssD1e5FE=
X-Google-Smtp-Source: AGHT+IGvNY9x8znPid+jlSUugq+7Voy4lhkFD150p7UMeaZJEhSIyuzOQxvdWb877xCzmOFRcxCZRA==
X-Received: by 2002:a05:600c:4f11:b0:435:9ed3:5698 with SMTP id
 5b1f17b1804b1-43668b5e09bmr177464715e9.24.1735218451158; 
 Thu, 26 Dec 2024 05:07:31 -0800 (PST)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4364a376846sm264591185e9.0.2024.12.26.05.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2024 05:07:29 -0800 (PST)
Date: Thu, 26 Dec 2024 15:07:27 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z21VD82XCOVgVJUh@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1mk08SHEd5_vc99@hovoldconsulting.com>
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

On 24-12-11 15:42:27, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
>  
> > +/**
> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable or disable transparent mode
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > +
> > +	return ret == 1 ? 0 : ret;
> 
> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
> sure it never returns 0 (for short transfers).

Will follow Dmitry's proposal here.

	if (ret < 0)
        	return ret;

	return (ret == 1) ? 0 : -EIO;


> 
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> 
> This appears to be what the driver currently uses, but why not
> EXPORT_SYMBOL_GPL?
> 
> > +
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> > + * @aux: DisplayPort AUX channel
> > + * @lttpr_count: Number of LTTPRs
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > +{
> > +	if (!lttpr_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > +	 * non-transparent mode and the disable->enable non-transparent mode
> > +	 * sequence.
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> 
> Error handling?

Yes, this makes sense. But other than throwing an error I don't think
there is much to be done. I'll add an drm_err here just in case. 

> 
> > +
> > +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> 
> No need to check lttpr_count again here.

So the logic behind lttpr_count and this transparency mode changing, as
specified in the DP standard, is as follows:

- If there are 0 LTTPRs counted, then nothing to be done, otherwise set to
transparent mode.

- Then, if there are between 0 and 8 LTTPRs counted, set non-transparent
mode successfully.

- Otherwise, rollback to transparent mode.

This last rollback might result in two transparent mode settings without
a non-transparent one in between, but AFAIU, that is OK. Making sure this
doesn't happen would just make the implementation more ugly without any
benefit, IMO.

> 
> > +		return 0;
> 
> I'd check for errors instead of success here and do the rollback before
> returning -EINVAL.
> 

Yes, I think it would be more cleaner. Will do that.

> > +
> > +	/*
> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> > +	 * the number of LTTPRs is invalid
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> > +
> > +	return -EINVAL;
> 
> And return 0 explicitly here.

Yes. Will do that.

> 
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> 
> In any case this works well and is needed for external display on the
> Lenovo ThinkPad T14s, while not breaking the X13s which does not need
> it:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan

Thanks for reviewing and testing!
Abel

