Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835E46F5A4
	for <lists+freedreno@lfdr.de>; Thu,  9 Dec 2021 22:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC77510E36B;
	Thu,  9 Dec 2021 21:11:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90B410E36A;
 Thu,  9 Dec 2021 21:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639084278; x=1670620278;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zkmEKQL4RVuZfJnTxoN2qSkfD6RebBkFj0Gic1+wH6w=;
 b=UJY5EHJVRQaoO/MwaHJC52KrRYbYxGxQcAUUsfOQFzY1b23C1LNBUNWG
 phY7jjGT9RL0mifQnO1NI6zAQAug1Yz1wgXsmmrDMZ7DisG3AgdiaWPSa
 t+E5ycI7DOPlGLEFnp70Cfn9xBLH8Dtfp+cYZLwl8e1SD88ixGRu+p+nw s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Dec 2021 13:11:17 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 13:11:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 13:11:16 -0800
Received: from [10.111.171.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 9 Dec 2021
 13:11:14 -0800
Message-ID: <4fe6b733-ff4b-ddcf-59b7-b5173aa73dd2@quicinc.com>
Date: Thu, 9 Dec 2021 13:11:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
 <20211201222633.2476780-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201222633.2476780-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH v1 4/8] drm/msm/dpu: drop plane's
 default_scaling debugfs file
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12/1/2021 2:26 PM, Dmitry Baryshkov wrote:
> Proper support for the 'default_scaling' debugfs file was removed during
> DPU driver pre-merge cleanup. Remove leftover file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 6ea4db061c9f..f80ee3ba9a8a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -114,7 +114,6 @@ struct dpu_plane {
>   	struct dpu_debugfs_regset32 debugfs_src;
>   	struct dpu_debugfs_regset32 debugfs_scaler;
>   	struct dpu_debugfs_regset32 debugfs_csc;
> -	bool debugfs_default_scale;
>   };
>   
>   static const uint64_t supported_format_modifiers[] = {
> @@ -1398,10 +1397,6 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>   		dpu_debugfs_create_regset32("scaler_blk", 0400,
>   				pdpu->debugfs_root,
>   				&pdpu->debugfs_scaler);
> -		debugfs_create_bool("default_scaling",
> -				0600,
> -				pdpu->debugfs_root,
> -				&pdpu->debugfs_default_scale);
>   	}
>   
>   	if (cfg->features & BIT(DPU_SSPP_CSC) ||
> 
