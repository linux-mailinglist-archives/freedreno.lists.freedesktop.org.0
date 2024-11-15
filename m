Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3B9CE15F
	for <lists+freedreno@lfdr.de>; Fri, 15 Nov 2024 15:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9077010E011;
	Fri, 15 Nov 2024 14:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AZadESFb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33B310E867
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 14:35:57 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53da353eb2eso3397432e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731681356; x=1732286156; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d43CGOrYwQTMl3TbKozwdFlBmEWO7EVgTabyaP0raws=;
 b=AZadESFbWMBVsHEACykKFscchmL3QmmxoPh6k7wUKakOjb9gTpGX6q9hGv7fk7Kf4l
 70YlMhoXhYFfkrU+UxpBZacSXwaHOtGg4HgGLeS6fFK5m1+8UnJqkW7ccEUADvg3HHkq
 PwMwJBjLf0FRrOPM8IpDz7VEEVop05uFDBP24ZW1jT7DIo/srgXTR7Kjx3rc3vvOlN8k
 5ZxkdrhwEGpCTRaWzxQc89uvUFO18FM/lczpBTUfSF/xVQ3Z5Pd38VXqMk97IHmAqqql
 tZy1l679Y6v5S5bJ5G2yoL+0L2zfclzf5271JFuLZubiynpXdf9xpDQZkEADIBiRptF7
 WQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731681356; x=1732286156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d43CGOrYwQTMl3TbKozwdFlBmEWO7EVgTabyaP0raws=;
 b=We3WjVXo7MvcwgG2hrOM//LK53aCQcaDM6JLxT6f4QRFzQChuzHXF75039R8oD9vt/
 tEFxu6/8OyiAPGmreq0MFh1wg49XxJhHnnoZQq+WWmNfmrwPpd9Zh1us9SY6ZQJvVHRJ
 Qu8N8tz+t9vnbf2WQF9s8CFiu5TA2JjVF6ecsygjncF6PvYga1zMw74MZUTIQGerf3xZ
 XdOGK7hut87JX5fq0RnjkFa8R9gQCWYjNgKt56VMHdXKm8UV7AdPYDox4Fvn3laSNSh4
 1wzyfrpK/SRkb8QFcjGoC+ZHU02HlcrCjj2ZlKfhwd0EDT+X2rJ6FOKGZzeceqoxISIW
 yDMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsHVDBuMiANJHHFFLUabN/5nRrFfgb8VTU97QNygd2+7n75Nrq7CDfV71KMi4gn72CUDPMBRypp+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYxBkzodRGtgX07KhK0OhYmdkK/r6sZ/8mDqJqX8obwlcGHvAg
 dHJlX/hLiDmAldH6uFhZYnTQvKqkLcMuJOULp4bBa8iI22AXfrMenLwe/+Om4n4=
X-Google-Smtp-Source: AGHT+IGLd55wpxXxX1fO2aUjNA5hPIFqY7ITl3o7gnKYbcvdkrET0x7ZnGF298YRTzlshfucVbwYBQ==
X-Received: by 2002:a05:6512:b1e:b0:53d:a504:9334 with SMTP id
 2adb3069b0e04-53dab3b1718mr2002254e87.44.1731681355937; 
 Fri, 15 Nov 2024 06:35:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da6500cbcsm586808e87.88.2024.11.15.06.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 06:35:54 -0800 (PST)
Date: Fri, 15 Nov 2024 16:35:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 4/8] drm/msm: adreno: dynamically generate GMU bw table
Message-ID: <6bcdwzmm267x3657iydnoxdnxacexitzwjkvihzn3y57vxq3n6@vuhgq2x3iy5g>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-4-3b8d39737a9b@linaro.org>
 <rvfrkb4v7cilzu3prv5dr2dni7m3jv3crhmto3uume5v5wxr5m@apvyb4lc2rre>
 <17243670-7e91-46f8-812d-3f21cee5cd2c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17243670-7e91-46f8-812d-3f21cee5cd2c@linaro.org>
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

On Fri, Nov 15, 2024 at 10:11:09AM +0100, Neil Armstrong wrote:
> On 15/11/2024 08:24, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 04:48:30PM +0100, Neil Armstrong wrote:
> > > The Adreno GPU Management Unit (GMU) can also scale the ddr
> > > bandwidth along the frequency and power domain level, but for
> > > now we statically fill the bw_table with values from the
> > > downstream driver.
> > > 
> > > Only the first entry is used, which is a disable vote, so we
> > > currently rely on scaling via the linux interconnect paths.
> > > 
> > > Let's dynamically generate the bw_table with the vote values
> > > previously calculated from the OPPs.
> > 
> > Nice to see this being worked upon. I hope the code can is generic
> > enough so that we can use it from other adreno_foo_build_bw_table()
> > functions.
> 
> I would hope so, but I don't have the HW to properly test it on those
> platforms.

Welcome to the club^W Lab.

> > > Those entried will then be used by the GMU when passing the
> > > appropriate bandwidth level when voting for a gpu frequency.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 +++++++++++++++++++++++++++--------
> > >   1 file changed, 37 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> > > index cb8844ed46b29c4569d05eb7a24f7b27e173190f..9a89ba95843e7805d78f0e5ddbe328677b6431dd 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> > > @@ -596,22 +596,48 @@ static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> > >   	msg->cnoc_cmds_data[1][0] = 0x60000001;
> > >   }
> > > -static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> > > +static void a740_generate_bw_table(struct adreno_gpu *adreno_gpu, struct a6xx_gmu *gmu,
> > > +				   struct a6xx_hfi_msg_bw_table *msg)
> > >   {
> > > -	msg->bw_level_num = 1;
> > > +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
> > > +	unsigned int i, j;
> > > -	msg->ddr_cmds_num = 3;
> > >   	msg->ddr_wait_bitmask = 0x7;
> > > -	msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
> > > -	msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
> > > -	msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
> > > +	for (i = 0; i < 3; i++) {
> > > +		if (!info->bcm[i].name)
> > > +			break;
> > > +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcm[i].name);
> > > +	}
> > > +	msg->ddr_cmds_num = i;
> > > -	msg->ddr_cmds_data[0][0] = 0x40000000;
> > > -	msg->ddr_cmds_data[0][1] = 0x40000000;
> > > -	msg->ddr_cmds_data[0][2] = 0x40000000;
> > > +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
> > > +		for (j = 0; j < msg->ddr_cmds_num; j++)
> > > +			msg->ddr_cmds_data[i][j] = gmu->gpu_bw_votes[i][j];
> > > +	msg->bw_level_num = gmu->nr_gpu_bws;
> > > +}
> > > +
> > > +static void a740_build_bw_table(struct adreno_gpu *adreno_gpu, struct a6xx_gmu *gmu,
> > > +				struct a6xx_hfi_msg_bw_table *msg)
> > > +{
> > > +	if ((adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE) && gmu->nr_gpu_bws) {
> > > +		a740_generate_bw_table(adreno_gpu, gmu, msg);
> > > +	} else {
> > 
> > Why do we need a fallback code here?
> 
> Because at this particular commit, it would generate an invalid table, I should probably remove the fallback at the end

Or move this to a generic code that generates a table if there is no bw
data (like there is none for older platforms with the current DTs).

> 
> > 
> > > +		msg->bw_level_num = 1;
> > > -	/* TODO: add a proper dvfs table */
> > > +		msg->ddr_cmds_num = 3;
> > > +		msg->ddr_wait_bitmask = 0x7;
> > > +
> > > +		msg->ddr_cmds_addrs[0] = cmd_db_read_addr("SH0");
> > > +		msg->ddr_cmds_addrs[1] = cmd_db_read_addr("MC0");
> > > +		msg->ddr_cmds_addrs[2] = cmd_db_read_addr("ACV");
> > > +
> > > +		msg->ddr_cmds_data[0][0] = 0x40000000;
> > > +		msg->ddr_cmds_data[0][1] = 0x40000000;
> > > +		msg->ddr_cmds_data[0][2] = 0x40000000;
> > > +
> > > +		/* TODO: add a proper dvfs table */
> > 
> > I think TODO is unapplicable anymore.
> > 
> > > +	}
> > >   	msg->cnoc_cmds_num = 1;
> > >   	msg->cnoc_wait_bitmask = 0x1;
> > > @@ -691,7 +717,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> > >   	else if (adreno_is_a730(adreno_gpu))
> > >   		a730_build_bw_table(msg);
> > >   	else if (adreno_is_a740_family(adreno_gpu))
> > > -		a740_build_bw_table(msg);
> > > +		a740_build_bw_table(adreno_gpu, gmu, msg);
> > >   	else
> > >   		a6xx_build_bw_table(msg);
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
