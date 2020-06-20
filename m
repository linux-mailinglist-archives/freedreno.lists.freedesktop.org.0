Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3A20232C
	for <lists+freedreno@lfdr.de>; Sat, 20 Jun 2020 12:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4788A6E079;
	Sat, 20 Jun 2020 10:26:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31D96E079;
 Sat, 20 Jun 2020 10:26:44 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9CEED5468307C131E412;
 Sat, 20 Jun 2020 18:26:41 +0800 (CST)
Received: from [10.173.222.27] (10.173.222.27) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Sat, 20 Jun 2020 18:26:31 +0800
To: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20200528130816.1670-1-yuzenghui@huawei.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <f1357380-9e98-4c1e-c1bf-a0a95bb5910d@huawei.com>
Date: Sat, 20 Jun 2020 18:26:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200528130816.1670-1-yuzenghui@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix usage of ERR_PTR()
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
Cc: airlied@linux.ie, robdclark@gmail.com, daniel@ffwll.ch,
 wanghaibin.wang@huawei.com, jsanka@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

ping for this obvious fix...

On 2020/5/28 21:08, Zenghui Yu wrote:
> ERR_PTR() is used in the kernel to encode an usual *negative* errno code
> into a pointer.  Passing a positive value (ENOMEM) to it will break the
> following IS_ERR() check.
> 
> Though memory allocation is unlikely to fail, it's still worth fixing.
> And grepping shows that this is the only misuse of ERR_PTR() in kernel.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index a1b79ee2bd9d..a2f6b688a976 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2173,7 +2173,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>   
>   	dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
>   	if (!dpu_enc)
> -		return ERR_PTR(ENOMEM);
> +		return ERR_PTR(-ENOMEM);
>   
>   	rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
>   			drm_enc_mode, NULL);
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
