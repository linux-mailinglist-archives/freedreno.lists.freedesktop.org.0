Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65EA025D8
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 13:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8932F10E646;
	Mon,  6 Jan 2025 12:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fcGSMKKw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842CA10E646
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 12:46:53 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so6928839f8f.1
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jan 2025 04:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736167552; x=1736772352; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M2cI20yQvFh0oTzvXey8G3cCYkJTkl8Kp3cskcOiadM=;
 b=fcGSMKKwrrKXeY1zyB36Ttr+NcJLcpZusXkX3uTPFy37CfulybacPt/kPSOADnM3zD
 IZPVetL3zxcX+/qJqAfeRHa3TootIjWGS0U358wWQ8k4tMb26B2zrxLXIoWnGzPYt1BN
 fiKoIaqiUrPNV2NNC7tZcAm7EgTZu1zBltod5MpTQLIPIvcgq/+cwHYanmQzi3i7LtTG
 jWfU8HKf8oi1arCP6Uk49VWgcXqZBfOSkcHk06Xm16LwoXxiZN1Km3nSiDAb/cVRYqcb
 BsIGWl+VFes3RH8Oljyq70lGpfMmKwBpXEtk5jLqyrTlk8Iv7n57BGY1sT8KtZxeflYh
 kAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736167552; x=1736772352;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2cI20yQvFh0oTzvXey8G3cCYkJTkl8Kp3cskcOiadM=;
 b=avNpTSQZL7RLIZqezrplqaguyUNbDwMcvdXBQiaqi3YMN6zHLQS485r5qOL41gSD1x
 wh2TS5lovpJi3Z2jaa1kNkFDygNh0/m78DDjsdjboPtiT7fvu+rFx0GUH9jy33qeSZR1
 cbxUPm3++OVpfcUuRJgTwdrJRMAYlpMurjXvAIKn3Tpuqxrysoe8fgkR7Cd7DqtS04xj
 iQd1O6ymENekTwEN3hnsOejgt1JXwThFI+JdL8tf0f8SzwNrhnuF8Cz3FYXVIMlWFkUK
 siWY1eOSZT6L8aX70N3BOrhgmTRAHxmzSRdT6Wg4cwTnf/KqBp98pgAno9iTN2JtJYjE
 yUpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWM12G4A87G8v9ExwXIa95Ui45/G9XUerTtaFM18iJl4SAei1Qu7fALQeGpGmiIISLzTKiNUclOKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0p72bBEY3gClJ9CpCN171Jgva8q/2quEsYUlzAiuSPCNLyaWh
 domF/sfwgiwgcceVgrgzwqlNDFwT8R/WTxmO2JwXdANhHcc4SfK+bcT/KhWcw6o=
X-Gm-Gg: ASbGncua6i1TsebjqHhPxxjg0c5IQG/UYgELUwtsME22/KTkLZeECb42lquxP3eIp8N
 aRu1q1XGLjI4S5LpZnuhljPbicNu7RNiyngWmipUB5JYYb2wiEASaUvfMgoaV3t36FjpRgvvoEh
 3oXGPEvS0B+2q72BezOc5Jt+R6UDOYsi/8PK1Njbe7eXSc9GBgnGhiZ0gMqGYuBnCvY5i8nx8mv
 cSmrNCgPlgWIYQHh/9hY1gzy1t5pyEGX3rGKtPhp9eNtyr93CAkGRY=
X-Google-Smtp-Source: AGHT+IGPXXCGpVVL8gkklF9ZQV+if58UuE9ZivrnPJUbIt2RzTzppNgGN6AJ5opvpHjGWhdKOASxmQ==
X-Received: by 2002:a05:6000:4b07:b0:385:fa20:658b with SMTP id
 ffacd0b85a97d-38a221f6135mr46513894f8f.24.1736167552118; 
 Mon, 06 Jan 2025 04:45:52 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b4274csm603466965e9.38.2025.01.06.04.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 04:45:51 -0800 (PST)
Date: Mon, 6 Jan 2025 14:45:48 +0200
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <Z3vQfIIDDgnFJsDn@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
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

On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > LTTPRs operating modes are defined by the DisplayPort standard and the
> > generic framework now provides a helper to switch between them, which
> > is handling the explicit disabling of non-transparent mode and its
> > disable->enable sequence mentioned in the DP Standard v2.0 section
> > 3.6.6.1.
> > 
> > So use the new drm generic helper instead as it makes the code a bit
> > cleaner.
> > 
> > Acked-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> >  1 file changed, 5 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> >  
> > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > -		return false;
> > -
> >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> >  
> > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> >  	int lttpr_count;
> > +	int ret;
> >  
> >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> >  		return 0;
> > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> >  		return lttpr_count;
> >  	}
> >  
> > -	/*
> > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > -	 * non-transparent mode and the disable->enable non-transparent mode
> > -	 * sequence.
> > -	 */
> > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > -
> > -	/*
> > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > -	 * non-transparent mode fall-back to transparent link training mode,
> > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > -	 */
> > -	if (lttpr_count < 0)
> > -		goto out_reset_lttpr_count;
> > -
> > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > +	if (ret) {
> >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> >  
> > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> >  		goto out_reset_lttpr_count;
> >  	}
> >  
> > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > +
> 
> I think the code now misses a way to update intel_dp->lttpr_common_caps
> in a transparent-mode case:
> intel_dp_set_lttpr_transparent_mode(intel_dp, true).

It is being called if the drm_dp_lttpr_init() returns a non-zero value,
but that is not part of the diff here.

> 
> >  	return lttpr_count;
> >  
> >  out_reset_lttpr_count:
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
