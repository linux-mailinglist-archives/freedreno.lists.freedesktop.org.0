Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9997FBB17
	for <lists+freedreno@lfdr.de>; Tue, 28 Nov 2023 14:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692FD10E516;
	Tue, 28 Nov 2023 13:16:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CFF10E515
 for <freedreno@lists.freedesktop.org>; Tue, 28 Nov 2023 13:16:00 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9b7bd6fffso5102541fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Nov 2023 05:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701177358; x=1701782158; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2U0Dw+C6h6+RoUlbLOMo/lv9uHPeB9SLzHDaRTZV7s=;
 b=pEsKQyipcVu8Rm8CpoEBkIVY+JAI/S0cl4fE1rSVJBK4DQv04t1bTBp6nJ93cmXcBD
 3A0+7bSg3UdkKOJZEDoK4HCW352HbyO8QVpBv3l7+kjcosCuSjm0t9yjdu5eSnVjLmTy
 oqLiH6TTjdX5q4p7kfDPeIJnxImcbtAmjZ6iPtQTZassAo6fxIIci0TuhQQwdB4HLFHQ
 CpFYYwCWCxp+ejD/EhXfIOS5C0rOoTcKlTSnkLDS8fG8NSQNFV4Cgs/WjPpGK26/rM5C
 MWJQUUmoSvoLW8JJ+M1/NR2n8tyCROvOHTu6K4MgRVp3kcy+fWU7YpCimioMV93MMxgp
 TV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177358; x=1701782158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2U0Dw+C6h6+RoUlbLOMo/lv9uHPeB9SLzHDaRTZV7s=;
 b=IeK0Yi9wYWD1oXAJJhnL86ZFgg+QQiugonnTh/8oqaKh+LgwOj6HGfMdbae8xR2gKK
 Js9WBlQ3JQQi9OaB8PYuuXIr1BtRmuwW4NVF0e5V6+J3EOLYStUHCgCMfx47pAp1JbSj
 gDUmHSKDn+3SEQDR1ALXHlhPyUxUpoIAW7ImW3nh1gn3eBoS52a4r4mi8pwJhmdrhOsi
 aWhcipCNY0y0YxFnnlpovAvCcutLo5x2GbrCQB5XatEnlJwPbNoaeant313lBOWzI5d0
 OeWYkLQuU6ivPAIQ2oKllql7xXg03btbOktxREVG6WA/YiZm3An3zQxVLqzlMp0d/v4y
 Mr9w==
X-Gm-Message-State: AOJu0YxWrWomM9ujp08OVSU1ZeExvpmwZd0fe4kefbx1dlx5BItgCLTt
 9XiMRYgI7JkI/wBXhX1mD9xRnA==
X-Google-Smtp-Source: AGHT+IEzEaz+EEBfeJx7la23pJ4m/XXEUN3X5Za/9Q6XMgt9Zg15Eol47FvI5Utk4vk+9djDSK1vPg==
X-Received: by 2002:a2e:888f:0:b0:2c9:b96e:16e4 with SMTP id
 k15-20020a2e888f000000b002c9b96e16e4mr403296lji.42.1701177358355; 
 Tue, 28 Nov 2023 05:15:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a2e9547000000b002b657f10b78sm1707226ljh.58.2023.11.28.05.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:15:57 -0800 (PST)
Message-ID: <37bfdc21-8d2a-4a6c-a2eb-9eaa1e808496@linaro.org>
Date: Tue, 28 Nov 2023 15:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
 <20231125-topic-rb1_feat-v2-12-979b28f35e4a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-12-979b28f35e4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 12/12] arm64: dts: qcom: qrb2210-rb1: add
 wifi variant property
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/11/2023 17:28, Konrad Dybcio wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The RB1 platform doesn't have board-specific board-id programmed, it uses
> generic 0xff. Thus add the property with the 'variant' of the
> calibration data.
> 
> Note: the driver will check for the calibration data for the following
> IDs, so existing board-2.bin files will continue to work.
> 
> - 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1'
> - 'bus=snoc,qmi-board-id=ff,qmi-chip-id=120'
> - 'bus=snoc,qmi-board-id=ff'
> 
> For the reference, the board is identified by the driver in the
> following way:
> 
> ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007 board_id 0xff soc_id 0x40670000
> ath10k_snoc c800000.wifi: qmi fw_version 0x337302d3 fw_build_timestamp 2023-01-06 01:50 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1
> ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> ath10k_snoc c800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc c800000.wifi: htt-ver 3.114 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

As you are resending this patch, you should add your S-o-b.

> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index ac597eb3fe9d..bd7bcf803654 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -535,6 +535,7 @@ &wifi {
>   	vdd-1.8-xo-supply = <&pm2250_l13>;
>   	vdd-1.3-rfa-supply = <&pm2250_l10>;
>   	vdd-3.3-ch0-supply = <&pm2250_l22>;
> +	qcom,ath10k-calibration-variant = "Thundercomm_RB1";
>   	status = "okay";
>   };
>   
> 

-- 
With best wishes
Dmitry

