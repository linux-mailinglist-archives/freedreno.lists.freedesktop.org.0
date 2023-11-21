Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A4C7F2815
	for <lists+freedreno@lfdr.de>; Tue, 21 Nov 2023 09:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A51B10E2A1;
	Tue, 21 Nov 2023 08:54:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5110E29B
 for <freedreno@lists.freedesktop.org>; Tue, 21 Nov 2023 08:54:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507a5f2193bso5474965e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 21 Nov 2023 00:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700556858; x=1701161658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B9xw1X7ZA/w4qP7ewLLpSYyupPFRZNLRs/Ge/9QSmfw=;
 b=wzwiP3pzltUYPRCG9vqhmf/mIQqpx7DyVVxxRFW5sEh/CkqY16G307pygYlGHAfQ+T
 yVvoSwbU4VPqT8NFM/PR4+EhP0mZ5Bs01gB3PXM97ujYhgg1NlbSkZa0pDje9LPeSLUu
 NBifeZRZZQIhXDFOX//RRgCW/5VSWdhx7mRne7IT3b4Nr8v693vSYY44JIjaT/V1yUxI
 h1CWGO5OmsRmHLsJco6jPDdJFeMfV0d49c2rBaS4bMc/zt/R6NR1XBi6Bh/yeGm9LB1F
 sRn3bAxQMSsA7608XxBu8ZI5nxQ9VdrEYW0OgMgfVtIIjX3v2R4BoYMx6/piHU8reG9N
 +ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700556858; x=1701161658;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B9xw1X7ZA/w4qP7ewLLpSYyupPFRZNLRs/Ge/9QSmfw=;
 b=rwFbs4EAW/1zRXye36z7npiADjS6TcJtVsAk5ODgr3zAv2deqkWjPnBSXVfEsM5JrS
 kD2t2wNQ2Dr5ljX41aNAoSAQXzOjJG8NL/GTpB8JZowyHtIAIGGgBcpGLi9KvR8e2iM0
 oumPJJMIofKJrq4brT0O5yh/leRkf/1gRJdAHFZs1NNnjvedXBiwbBJ/db7akJuVKUyQ
 QuBjXOnCyK597aMgBIkqJlPyJllqYoucH/H8UsGrVaHgtpvHqERSIColsYkmsx1/nYVf
 UIbJBO06N6k20ROY17HAl43Rqoc1vnmHG+4wwVuTv8BmeiIcgS+t1vtMxopeKmJ8An5O
 B8hQ==
X-Gm-Message-State: AOJu0Yz/O/tFi0zKZNJAmb/ZMD3yzMKXAG49RNrj5f+OW5U7YclWDOGE
 QwI96TShFk5EdPkZdvSJeYDv/g==
X-Google-Smtp-Source: AGHT+IF1xuQVsWLIefERP/sR6Kn9g3CbTRMtFwzRE/bayjQ5Xh7VoLcJ8SVMJ610YuVMdXcCuAIcKw==
X-Received: by 2002:a05:6512:3e25:b0:500:acae:30c5 with SMTP id
 i37-20020a0565123e2500b00500acae30c5mr737235lfv.15.1700556857891; 
 Tue, 21 Nov 2023 00:54:17 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w3-20020ac25983000000b0050aa51bd5b5sm1150927lfn.136.2023.11.21.00.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 00:54:17 -0800 (PST)
Message-ID: <209eceaa-10b0-47fc-aabf-1cfb0e1c9ce0@linaro.org>
Date: Tue, 21 Nov 2023 10:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 6/6] usb: typec: qcom-pmic-typec: switch
 to DRM_AUX_HPD_BRIDGE
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/11/2023 01:03, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Greg, Bryan, could you pease ack merging this patch through the drm-misc 
tree together with the rest of the series?

You have acked patch 3, but since that time I added this one.

> ---
>   drivers/usb/typec/tcpm/Kconfig                |  1 +
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 41 +++----------------
>   2 files changed, 7 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 0b2993fef564..64d5421c69e6 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -80,6 +80,7 @@ config TYPEC_QCOM_PMIC
>   	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	depends on DRM || DRM=n
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
>   	help
>   	  A Type-C port and Power Delivery driver which aggregates two
>   	  discrete pieces of silicon in the PM8150b PMIC block: the
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 581199d37b49..1a2b4bddaa97 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -18,7 +18,7 @@
>   #include <linux/usb/tcpm.h>
>   #include <linux/usb/typec_mux.h>
>   
> -#include <drm/drm_bridge.h>
> +#include <drm/bridge/aux-bridge.h>
>   
>   #include "qcom_pmic_typec_pdphy.h"
>   #include "qcom_pmic_typec_port.h"
> @@ -36,7 +36,6 @@ struct pmic_typec {
>   	struct pmic_typec_port	*pmic_typec_port;
>   	bool			vbus_enabled;
>   	struct mutex		lock;		/* VBUS state serialization */
> -	struct drm_bridge	bridge;
>   };
>   
>   #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
> @@ -150,35 +149,6 @@ static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
>   	return 0;
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM)
> -static int qcom_pmic_typec_attach(struct drm_bridge *bridge,
> -				     enum drm_bridge_attach_flags flags)
> -{
> -	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
> -}
> -
> -static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
> -	.attach = qcom_pmic_typec_attach,
> -};
> -
> -static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
> -{
> -	tcpm->bridge.funcs = &qcom_pmic_typec_bridge_funcs;
> -#ifdef CONFIG_OF
> -	tcpm->bridge.of_node = of_get_child_by_name(tcpm->dev->of_node, "connector");
> -#endif
> -	tcpm->bridge.ops = DRM_BRIDGE_OP_HPD;
> -	tcpm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> -
> -	return devm_drm_bridge_add(tcpm->dev, &tcpm->bridge);
> -}
> -#else
> -static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
> -{
> -	return 0;
> -}
> -#endif
> -
>   static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   {
>   	struct pmic_typec *tcpm;
> @@ -186,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	struct device_node *np = dev->of_node;
>   	const struct pmic_typec_resources *res;
>   	struct regmap *regmap;
> +	struct device *bridge_dev;
>   	u32 base[2];
>   	int ret;
>   
> @@ -241,14 +212,14 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	mutex_init(&tcpm->lock);
>   	platform_set_drvdata(pdev, tcpm);
>   
> -	ret = qcom_pmic_typec_init_drm(tcpm);
> -	if (ret)
> -		return ret;
> -
>   	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
>   	if (!tcpm->tcpc.fwnode)
>   		return -EINVAL;
>   
> +	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> +	if (IS_ERR(bridge_dev))
> +		return PTR_ERR(bridge_dev);
> +
>   	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
>   	if (IS_ERR(tcpm->tcpm_port)) {
>   		ret = PTR_ERR(tcpm->tcpm_port);

-- 
With best wishes
Dmitry

