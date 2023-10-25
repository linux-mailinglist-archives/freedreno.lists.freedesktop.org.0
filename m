Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C534D7D6C48
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 14:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8529710E650;
	Wed, 25 Oct 2023 12:48:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BAC10E650
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 12:48:56 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c5039d4e88so86713431fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 05:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698238134; x=1698842934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mhfK3Xbp7dGorRag1GQdAYkUAEC0Al9vXL9om2bY/oI=;
 b=DTA8OtC5+rSFQc8EtogiKN1okII1XUZNOrboC5bhI6joe6pkbDMqMjj6L5xS2oFdIM
 HNB98t79V/RvugxchsoMONYJqWpliXt8MM+tgyLfcUL2DvN5weCtuU50vLyKw+u4/j4V
 JWEZ/y5+d+GJiTOcoHBFRyu8kLzumkStmVRxaCobtwS/PvdgxMdg4sRaAO9OjrZoBacH
 B9HB6respGG3Th330z1pCncA3j7bVFB82vt3ym7ZNC/FwjFCnWWbaNQIH12v0M+A3tnR
 i9Lg7r4wNxcrpnKjkRghammPaUf3X4WeaoLt2lJ13on+NublHWefSR8N9HDKVERAK9T/
 cOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698238134; x=1698842934;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mhfK3Xbp7dGorRag1GQdAYkUAEC0Al9vXL9om2bY/oI=;
 b=IApcAoRwJ9z0Ehq+JKSoVBfswuG67wHMJP0u0olesTQJH4IBztUWz2DIJ9J0lR3c02
 CI2NDTTdDCqUzF2ge1x9KSAeWD9dWWo6HTY+4XBKoFFiL7Os74TiLEvx0dj/scnzT0U/
 Et0PPLJOnWWkDFU+mcBUAmzDsg2pBGbo8wT7Hw7jZQoHmA3irf0YCS8ELXhyv3BO9iQf
 gKcPGrGt4gvaIsDNka6VzKzYdfsqelTWwV3dVACZXHF3CIzBsaNn1qS1o0E+BAkLJRRe
 hxysy+NcRahRlkVrFXG//zZmIrdbezEyqLYHFXomMsofsvAkNhnn4kjXw7zyI04eD+cv
 m/cA==
X-Gm-Message-State: AOJu0YxN3HFXUXrb0Piqb8OY07/JiyQEV1T1Z6OvxyyCOKS6AKw+rSzG
 OC8ZzQRuKiuCnbaTAAhBc+e2cA==
X-Google-Smtp-Source: AGHT+IGtGtGHKJuO0bAirx2hne0N0Y/3+/cSERvZVDPv9gjGAUiKzMFk7r5OAYKMrzB4SUepkCEJgA==
X-Received: by 2002:a2e:86c7:0:b0:2c5:1602:53f6 with SMTP id
 n7-20020a2e86c7000000b002c5160253f6mr10457117ljj.34.1698238134501; 
 Wed, 25 Oct 2023 05:48:54 -0700 (PDT)
Received: from [192.168.53.189] ([188.162.65.61])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a2e9187000000b002c0167edd86sm2443551ljg.122.2023.10.25.05.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 05:48:53 -0700 (PDT)
Message-ID: <c5c233e9-a3e7-4a65-b1d5-cf11e68d0f8e@linaro.org>
Date: Wed, 25 Oct 2023 15:48:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
 <ZTkIpMWpxKzSE7gQ@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZTkIpMWpxKzSE7gQ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] soc: qcom: pmic_glink: fix connector type
 to be DisplayPort
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Simon Ser <contact@emersion.fr>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/10/2023 15:23, Johan Hovold wrote:
> On Wed, Oct 11, 2023 at 01:52:29AM +0300, Dmitry Baryshkov wrote:
>> As it was pointed out by Simon Ser, the DRM_MODE_CONNECTOR_USB connector
>> is reserved for the GUD devices. Other drivers (i915, amdgpu) use
>> DRM_MODE_CONNECTOR_DisplayPort even if the DP stream is handled by the
>> USB-C altmode. While we are still working on implementing the proper way
>> to let userspace know that the DP is wrapped into USB-C, change
>> connector type to be DRM_MODE_CONNECTOR_DisplayPort.
>>
>> Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
>> Cc: Simon Ser <contact@emersion.fr>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
>> index 9569d999391d..6f8b2f7ae3cc 100644
>> --- a/drivers/soc/qcom/pmic_glink_altmode.c
>> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
>> @@ -467,7 +467,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
>>   		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
>>   		alt_port->bridge.of_node = to_of_node(fwnode);
>>   		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
>> -		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
>> +		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>>   
>>   		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
>>   		if (ret) {
> 
> I was just going to post a patch fixing this after finally investigating
> why the DisplayPort outputs on the X13s were annoyingly identified as
> "Unknown20-1" and "Unknown20-2" instead of the expected "DP-1" and
> "DP-2".

Well, that depends on the userspace being updated to know about USB 
connectors or not. But you are right, we should probably mention that in 
the commit message.

> 
> A lore search just before posting led me to this fix from two weeks ago.
> 
> I think the commit message should have mentioned something about the how
> this change affects user space. My patch also had a CC stable, but I
> guess we can ping the stable team once it hits mainline:
> 
> commit e5f55bf5ad4effdd59d4d06c839a0ac553a73c7d (HEAD -> work)
> Author: Johan Hovold <johan+linaro@kernel.org>
> Date:   Wed Oct 25 11:54:09 2023 +0200
> 
>      soc: qcom: pmic_glink_altmode: fix DP alt mode connector type
>      
>      The PMIC glink altmode bridge connector type should be "DisplayPort"
>      rather than "USB", which is intended for custom USB display protocols
>      (e.g. see 40e1a70b4aed ("drm: Add GUD USB Display driver")).
>      
>      This specifically makes the DisplayPort outputs on the Lenovo ThinkPad
>      X13s show up as "DP-1" and "DP-2" rather than "Unknown20-1" and
>      "Unknown20-2" with xrandr as expected (by users and tools):
>      
>        Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 5120 x 4096
>        eDP-1 connected primary 1920x1200+0+0 (normal left inverted right x axis y axis) 286mm x 178mm
>           1920x1200     60.03*+
>           1600x1200     60.00
>        DP-1 disconnected (normal left inverted right x axis y axis)
>        DP-2 connected (normal left inverted right x axis y axis)
>           1920x1200     59.95 +
>        ...
>      
>      Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
>      Cc: stable@vger.kernel.org      # 6.3
>      Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan

-- 
With best wishes
Dmitry

