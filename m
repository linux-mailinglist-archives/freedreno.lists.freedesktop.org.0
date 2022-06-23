Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D51955839E
	for <lists+freedreno@lfdr.de>; Thu, 23 Jun 2022 19:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB08210E031;
	Thu, 23 Jun 2022 17:32:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223A910E031
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jun 2022 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656005577; x=1687541577;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+18geU6kgLSNuF8HqLH40DKFCzt6e4PapO6WZMaC8r4=;
 b=zbJvFAF6ooZBlEpnAO1MIDzAp6IwUuqVU8Kfn6JfZc44NAp6JZhhm3QQ
 r8WksWefG0q261dPhOIIJ7gEPxyCdh7hHuaiSzM3a9MFpO+x82rZZI7s6
 CitrMJEx5TdFfb8qLWkJFianQgK9MmUd9gLH+U02m3TKKZuqMOANPwuat U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Jun 2022 10:32:56 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 10:32:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 23 Jun 2022 10:32:55 -0700
Received: from [10.111.161.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 23 Jun
 2022 10:32:53 -0700
Message-ID: <5736c38e-b262-0697-be77-b5126fe4d65b@quicinc.com>
Date: Thu, 23 Jun 2022 10:32:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: sunliming <sunliming@kylinos.cn>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>
References: <20220623012707.453972-1-sunliming@kylinos.cn>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220623012707.453972-1-sunliming@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Subject: Re: [Freedreno] [PATCH RESEND] drm/msm/dpu: Fix variable
 dereferenced before check
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
Cc: kelulanainsley@gmail.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan
 Carpenter <dan.carpenter@oracle.com>, kernel test robot <lkp@intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 6/22/2022 6:27 PM, sunliming wrote:
> Fixes the following smatch warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:261
> dpu_encoder_phys_wb_atomic_check() warn: variable dereferenced before check 'conn_state'
> 
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for 
writeback")
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 59da348ff339..0ec809ab06e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -252,11 +252,6 @@ static int dpu_encoder_phys_wb_atomic_check(
>   	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>   			phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
>   
> -	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> -		return 0;
> -
> -	fb = conn_state->writeback_job->fb;
> -
>   	if (!conn_state || !conn_state->connector) {
>   		DPU_ERROR("invalid connector state\n");
>   		return -EINVAL;
> @@ -267,6 +262,11 @@ static int dpu_encoder_phys_wb_atomic_check(
>   		return -EINVAL;
>   	}
>   
> +	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> +		return 0;
> +
> +	fb = conn_state->writeback_job->fb;
> +
>   	DPU_DEBUG("[fb_id:%u][fb:%u,%u]\n", fb->base.id,
>   			fb->width, fb->height);
>   
