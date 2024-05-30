Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136408D8A52
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2024 21:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906D310E3E4;
	Mon,  3 Jun 2024 19:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="O7xCvbQf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9499611B5D6
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 09:48:01 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-35dc7d0387cso666667f8f.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717062480; x=1717667280;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2pMMndQo0Yg4u3ej2HOS1ixNtUd/Tv/4Lxi94E6B51k=;
 b=O7xCvbQffqJKfN7QBaiK3eIIs2t6iNEiZExqxQauPFWaUyS9t8EqYYFj4v8BQbZE4b
 PmuVOl+gS426H8ONxo72IP/Ksqy/kzWrbtk4v7CLWq9BixObhqeK8347MS/Iqf7pdNCd
 p2rr1ghGpvpkfyGWrvaPtLyaekVjq9BFxlxZ0wQh0qtwGyh8I/3Tnc3dz+CkgCo95Rsw
 1arx4ZC4dA8Jo84NKd5rRy1TEH0NQigKtVisxz8iSQv9lzidA2l346mMOJU5hbiSajy3
 l04F20VWadcxfEhhcG4yUYeBfbP8ZeTx8T8fVTEwmFQ5UyHBBrPwtJbnRUVEOHgp4+Eo
 doBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717062480; x=1717667280;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2pMMndQo0Yg4u3ej2HOS1ixNtUd/Tv/4Lxi94E6B51k=;
 b=KmkCx/uxRdWSvHhd1oeTvVqb/aI0h+uaUSRTiZKNms9NFTa6zdmkZtRl29ofxHyEJC
 bRtR3jXLkARFi2/sdP/I/neNxBzzCUPbDJnakI4G1ypo+bnI8FGJa25S1N8bJ27ZGaxp
 Vf+kKjfY0R8DQGe5tjxb0+KP5PM3uWPlDY5LqjdW4/4X113WOFbJjTkLjNMh+8G2jagx
 BnIzPls0XU9GtuVydUjmk3Usbh3DYE1I1sgNbL1Wc05l9q/RuWcWDoTq2cgjpAX34ser
 I+CxUoYSGqIVG8Ky7NRELRWRqBXohX1/DFadEo/xjKSKwiapRxADG+eco2urCRQ8Caxr
 X74w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcwVSb3gZ+lew6fqI+B6vVsXhKi3yuD8GZdEFdCkEJ3l9SoTpCOvrZ08Xu+6z6gU+cPJdCBoI0xZrMBcVNPI/UydCzILgv8Gwf8rW6aMQO
X-Gm-Message-State: AOJu0YyW5tVEh2gOmKwsydvtaPngFJbIgXLqKRqy2mGCPYlRnIP5dkD/
 3iEps9cc4IhxfpUU3VhvfETnbGwW5WHhQzHAKluQelhPu4cs0BA8tJAPad1gnFg=
X-Google-Smtp-Source: AGHT+IGmVWJIHpVS6zUzWQMTWFF7Uf2JRClJM21btErmVANQCNf/7aiObxoWiYzf0ACbQ1o7s8mC7w==
X-Received: by 2002:adf:e30b:0:b0:354:f3f4:c007 with SMTP id
 ffacd0b85a97d-35dc0095526mr1477892f8f.29.1717062480021; 
 Thu, 30 May 2024 02:48:00 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557dcf001esm17118609f8f.97.2024.05.30.02.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 02:47:59 -0700 (PDT)
Message-ID: <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
Date: Thu, 30 May 2024 11:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 03 Jun 2024 19:38:24 +0000
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

On 16/05/2024 10:43, Marijn Suijten wrote:

> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
>
>> When create_address_space() fails (e.g. when smmu node is disabled)
>> msm_gpu_init() silently fails:
>>
>> msm_dpu c901000.display-controller: failed to load adreno gpu
>> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
>>
>> Log create_address_space() failure.
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> 
> Thanks!
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> And, after checking the below:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>  drivers/gpu/drm/msm/msm_gpu.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index 655002b21b0d5..f1e692866cc38 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -941,6 +941,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>  		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
>>  	else if (IS_ERR(gpu->aspace)) {
>>  		ret = PTR_ERR(gpu->aspace);
>> +		DRM_DEV_ERROR(drm->dev, "could not create address space: %d\n", ret);
> 
> Maybe this wasn't done before because this also includes `-EPROBE_DEFER`, so you
> might want to wrap this in
> 
> 	if (ret != -EPROBE_DEFER)
> 		DRM_DEV_ERROR...
> 
> But then dev_err_probe() was built specifically to be less verbose about this
> (and track defer reasons).  While this is an init and not probe function, it's
> called from struct component_ops->bind where it should be okay to call that,
> as long as you have access to the component `struct device*` and not its master
> (IIRC).


Hello Marijn,

I have moved on to HDMI.

Feel free to take full ownership of this submission,
as I won't have the energy to get it accepted.

Regards,

Marc

