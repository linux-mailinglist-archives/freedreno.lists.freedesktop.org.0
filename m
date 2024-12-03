Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67039E2FF3
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 00:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F4310E0B9;
	Tue,  3 Dec 2024 23:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zx923ZpF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C4C10E0B9
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 23:38:16 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53ded167ae3so6685100e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 15:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733269094; x=1733873894; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PvIkRrq0tXitj5MQqLQ3oqy5bggdWAmTtXbggggiuHU=;
 b=Zx923ZpFbExS3mfiBanPAE/5ezTrznc0aNJGC2vCXfHzGZ32np7MxrLdiKZeUr4cwb
 3cDJ43oN+wD8Ueyr4sOVopzWbIdHkz1vXYA8T3uZRfwbsdfGMSNsaAdzqdkaBII6sXK9
 H0htBPalBT2sjqPse50ON9s/+x6DJfycZVs/lnMFBNdbKxp3T/e3CRWhdazpcUqdgjMO
 Xs+Nm2niN/Xez/qen+zQDo8jSCxoPvRODAPgGXdcRJfX/ThshyXgpe+46ngdjX/28g0d
 IT6g3bNnRnTGZucd+zcowUN7sycZO7PC28HUPhe+T9OTbAh7enjfTyxQeKKVM3cOGstW
 zFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733269094; x=1733873894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PvIkRrq0tXitj5MQqLQ3oqy5bggdWAmTtXbggggiuHU=;
 b=K/Zaxj5R5Cyisu/7Ut6TmnglJ0Ef3/HQwPKXaxmRPLYSlzigbKQ/kEtfOryY3+pzg1
 wGryYxGX+5N56ZNaGrsoMfMJNPJkbqL+AXyFjyo6LvwIMVf3otV204O8lo1v8soY2Hlw
 6y1o5GAJD7RpB13PUQccg0WHnt/ki4FgpW+Kqk1p8pBuQNd4ZsyhDWUbUwOve4sInrz0
 sBshem6dlPpfFWu5VIyEQ71yzRJxY9lWAc2SCf9h4KlY3LYcgm9L+cBsIcnWcW08wByr
 Qr2XdNCY9xw32iOzXc0VErO13/IeEoQnPbindC6jtzzDcaa2bzbKidvLwdjuFONPadNd
 iEQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSfj2FZJ9lGa15400X0vSy7j2xG8qiDXDqJrFvffJYRaPvvFKfuv8lS8nSqjAQmDxLl0yvQvXr2nM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy37XwfTEjEGuv/8/82/CpG84XQcGugmBO76tdb4OrQLjhmr0T4
 1iedwRFimeRy3WxJ+gcILqLgm2gTppDaVnGmVTUnmneXL6wz8a/RKO5MSRHlzmE=
X-Gm-Gg: ASbGncsbm8MTbSbY7ENVQWDwcZKAprqINQze+aP8A3bvwioZVkxu7nQz4BUTuWJ0neW
 2tDpnwX8i+hSKoiYX+HXNz5uMb3UGxWjJ2555ZCHmcBX/nXnRKLMq/2mcoW5pUgUTox8Y+kXLz8
 M91TmbWG6c94D/QoluVnWIbl7eL+lWicFiAbfDHL7rWt2UT6To/LPufyYF36AJ2dVCHb1oNOGi6
 hvsUzk51fMk5cC1r+tlG0pyBrCPtSsNzRaWorZi42pcISYJQzm3a0+4CTBEYIiccjKPkRLT0OAk
 1qRobC1CztOSLypbd8PKaknAz4IMZg==
X-Google-Smtp-Source: AGHT+IFEAY3DxNqKHxw8mhGMitDTHIqwhcTfqELsGsjzfMmTb1zcKOW4rDkr5UYxAPj+4eEnCeVPww==
X-Received: by 2002:a05:6512:10c5:b0:53e:1c3d:d1ae with SMTP id
 2adb3069b0e04-53e1c3dd2c2mr500865e87.29.1733269094445; 
 Tue, 03 Dec 2024 15:38:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6496903sm1980271e87.210.2024.12.03.15.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:38:13 -0800 (PST)
Date: Wed, 4 Dec 2024 01:38:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 3/3] drm/msm/dp: add a debugfs node for using tpg
Message-ID: <uv2phgi72mmw5c462ijsqlqedeiv4gahrwi26i2luqkhgwmfxc@ycj7jrujdj6w>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-3-0fd6b518b914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-3-0fd6b518b914@quicinc.com>
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

On Mon, Dec 02, 2024 at 12:42:00PM -0800, Abhinav Kumar wrote:
> DP test pattern generator is a very useful tool to debug issues
> where monitor is showing incorrect output as it helps to isolate
> whether the issue is due to rest of DPU pipeline or in the DP
> controller itself. Expose a debugfs to use the TPG configuration
> to help debug DP issues.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 61 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 22fd946ee201..843fe77268f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -197,6 +197,65 @@ static const struct file_operations test_active_fops = {
>  	.write = msm_dp_test_active_write
>  };
>  
> +static ssize_t msm_dp_tpg_write(struct file *file, const char __user *ubuf,
> +				size_t len, loff_t *offp)
> +{
> +	const struct msm_dp_debug_private *debug;
> +	char *input_buffer;
> +	int val;
> +	int status = 0;
> +	struct msm_dp_panel *dp_panel;
> +
> +	debug = ((struct seq_file *)file->private_data)->private;
> +	dp_panel = debug->panel;
> +
> +	input_buffer = memdup_user_nul(ubuf, len);
> +	if (IS_ERR(input_buffer))
> +		return PTR_ERR(input_buffer);
> +
> +	status = kstrtoint(input_buffer, 10, &val);
> +	if (status < 0) {
> +		kfree(input_buffer);
> +		return status;
> +	}
> +
> +	msm_dp_panel_tpg_config(dp_panel, val);
> +
> +	dp_panel->tpg_enabled = val;

Does this need any kind of locking? The driver performs some actions,
then we write the global state. What if the user in parallel writes
different values to the file?

> +
> +	kfree(input_buffer);
> +
> +	*offp += len;
> +	return len;
> +}
> +
> +static int msm_dp_tpg_show(struct seq_file *f, void *data)
> +{
> +	struct msm_dp_debug_private *debug = f->private;
> +	struct msm_dp_panel *dp_panel = debug->panel;
> +
> +	if (dp_panel->tpg_enabled)
> +		seq_puts(f, "1");
> +	else
> +		seq_puts(f, "0");
> +
> +	return 0;
> +}
> +
> +static int msm_dp_tpg_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, msm_dp_tpg_show, inode->i_private);
> +}
> +
> +static const struct file_operations msm_dp_tpg_fops = {
> +	.owner = THIS_MODULE,
> +	.open = msm_dp_tpg_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = msm_dp_tpg_write
> +};
> +
>  int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
>  		  struct msm_dp_link *link,
>  		  struct drm_connector *connector,
> @@ -231,6 +290,8 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
>  		debugfs_create_file("dp_test_type", 0444,
>  				    root,
>  				    debug, &msm_dp_test_type_fops);
> +
> +		debugfs_create_file("dp_tpg", 0444, root, debug, &msm_dp_tpg_fops);

I'd say, skip the dp_ part of the name, everything in that dir is
DP-related.

>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 0e944db3adf2..7910b11fd685 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -50,6 +50,8 @@ struct msm_dp_panel {
>  	u32 max_dp_link_rate;
>  
>  	u32 max_bw_code;
> +
> +	bool tpg_enabled;
>  };
>  
>  int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
