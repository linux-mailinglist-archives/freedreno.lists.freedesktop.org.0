Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F57F2AEB
	for <lists+freedreno@lfdr.de>; Tue, 21 Nov 2023 11:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C8510E25A;
	Tue, 21 Nov 2023 10:46:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF5D10E25A
 for <freedreno@lists.freedesktop.org>; Tue, 21 Nov 2023 10:46:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3316d3d11e1so2187485f8f.0
 for <freedreno@lists.freedesktop.org>; Tue, 21 Nov 2023 02:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700563571; x=1701168371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YQ9oHc/Z7VmSRjGiVHn+TQLl6XB6fBGVSa6lAReK2Q=;
 b=Ag9W4qKRkXIjiIvtMd86dkxGzGNT6jVFXvZrrT22tAQzne9uFY3Ad35gz1ZAoD9BXI
 E8DwQ8HOOzT+A8CggsQahAKmWcsKiQMqu+WMAHOrc/HfDNKPb0TxTLHhn0aUIZdjCD9R
 oAwQfpQZgE/qt07+AjGWCWHxurh7PR4y0DZqb+LEr8rBnlUzH2CHcK89D/rduvKVF81l
 csLjh+b6uwlufh8uCMaU61TZHN+Dg8LWVwdf0WSV9IK8pq6q7qPN30lr8RnOBukMxPTd
 CclKfhlsJBTfnAp6E90XoCTv8swDom7EcES4W0hYfKLrAUVPd6m1boI12npBH+CPVPAA
 9T2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700563571; x=1701168371;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YQ9oHc/Z7VmSRjGiVHn+TQLl6XB6fBGVSa6lAReK2Q=;
 b=WAH517ms/ezp8cCiaaWfauktV3bLd37Jdl0nW7N5v21BO+aT2X7qjMuRIKuZkjEt02
 A0xtfPRBfF8gdd/RGnSsntnOZ0BvcVMNdp9h43bMPUU14t+/yuuWE1yD0k4NOPUhqB+q
 ns0VvmecYohOFDgmfB0cGQZLDAoAmVyZOKWNeUUVTqp6kUo9gl4IQvwm08O8zAeOYwOO
 PJh+i82yjoBf0yeg0XMXGxnc7U422QhuJk0XtRUg8pTPhdPfUHdeN/4tJEfXXF6QzL+2
 gUYEn1aIbFOiKU1WfRfaoYjOaG10V+LoT08IzPzwceIHlTBw5ep+4fvy9RVxsY9Zlt2c
 ZiZg==
X-Gm-Message-State: AOJu0YzZQK51Uuai6IYq8xFm6TuDGixuGm2ORpCnljwSeEoDNDVxcX0h
 b93kyyfLFQWTGKsyD+EWhFQqNQ==
X-Google-Smtp-Source: AGHT+IEeZ8W+Q8V/otGe4qIWbM9OBl6X7yXc7iTRxrT4SgTPAzPVtLB58IlgIl50TaKNv0wMDaLYNA==
X-Received: by 2002:a05:6000:18ae:b0:332:c789:4bed with SMTP id
 b14-20020a05600018ae00b00332c7894bedmr1937246wri.23.1700563571319; 
 Tue, 21 Nov 2023 02:46:11 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
 by smtp.gmail.com with ESMTPSA id
 q15-20020adff94f000000b0033169676e83sm14261662wrr.13.2023.11.21.02.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 02:46:10 -0800 (PST)
Message-ID: <e67c00fd-37f2-4ede-983f-c8c46bf847f1@linaro.org>
Date: Tue, 21 Nov 2023 10:46:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
 <20231103230414.1483428-7-dmitry.baryshkov@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

On 03/11/2023 23:03, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> +	if (IS_ERR(bridge_dev))
> +		return PTR_ERR(bridge_dev);
> +

What is the effect if we never attach any bridged devices ?

We make an aux device that just hangs around and eventually get cleaned 
up on release ? That's the way I read this code anyway.

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
