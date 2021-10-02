Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436941F8FB
	for <lists+freedreno@lfdr.de>; Sat,  2 Oct 2021 03:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3566E80B;
	Sat,  2 Oct 2021 01:09:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDAF6E829
 for <freedreno@lists.freedesktop.org>; Sat,  2 Oct 2021 01:09:12 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m3so44625305lfu.2
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 18:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QJi5dnZCRKyuIr330IEjUyQqWCQ+hUanK7f88GGsu9Y=;
 b=nFHh7xfeu3FDgfUVmmY7kwwhhlAStH/ZjAG7GcUikKfIqKSAUt8ypN75c+TWlVlGx7
 9hvUnWWt4W4QtbuOZpa4cav8jbDq8bMTzwJg3fjNlZC0LJPShuHZfVdR8O9Lw+OoJwpg
 IDbDajtOhCaK1OJRoscZkI15jZcmKN4dJZM8gD+4JPDLjVrJMxZO5NEf8SYyBk7c2yq3
 R4ZCVuHd1KMJilEloga5g/IzGElbkf3QCSWo0SLNqdoK/mzVYQXKN2VoMB7Pt+XZ/asi
 f9Kcv1TmPCxa2ENHfVxpaju+164xC38UZjrUFDSPvq0DluzEM0x4aBpUE5eA/Ki8swEL
 pLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QJi5dnZCRKyuIr330IEjUyQqWCQ+hUanK7f88GGsu9Y=;
 b=dqGBS493O8GRi+zD8KhE5pTP2cHiqldSVXV7r2lQmd8N5xoyhL0fbSPy/6FqBsnjtc
 imGVRNmvKsRZDLddCbwmDBjJYRp8UGHHD+YRxRq3hqL1WaaMk9FORdX2psdHL/Of9TiP
 52LEca4cmrY7Q5xQkLONX7OeqAluuuu8DCHJIawUxCZ8qvZAsxH3s27SIAAMcCZdW2hL
 FvfeDoy91azjcEKaoIGXUEG7haApJDU6XgHhmNvsKzivziJ3Bs6l4UYMM9JaM1e8AP/a
 soSURA8O5/u/pcA5EKk3vjHsIhqtd4A9mmzOrISXCAu9iTWmTp5SKuDW61X6gfav9zxX
 NxKw==
X-Gm-Message-State: AOAM5337X8yAe+PWNGrlfDy1gxp/EomJZbJHAWRP9aJf033HDXE6wxzY
 mY4p9ihRsQRiIEgrZSqOOyxuOVC9hVP/Gw==
X-Google-Smtp-Source: ABdhPJwxzP+S3xwprLe/RPXXMzTtfSmSOF8004b+WHO3RmXKN3BGThk4h2PUn2QcZOVxPlyH+VLdBg==
X-Received: by 2002:a05:6512:31c6:: with SMTP id
 j6mr1183238lfe.436.1633136950279; 
 Fri, 01 Oct 2021 18:09:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t10sm280248lfq.251.2021.10.01.18.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 18:09:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20211002010814.647394-1-dmitry.baryshkov@linaro.org>
Message-ID: <1e5700d7-ff19-b714-3192-9f9794056a54@linaro.org>
Date: Sat, 2 Oct 2021 04:09:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211002010814.647394-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] mfd: qcom-pm8xxx: switch away from
 using chained IRQ handlers
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

On 02/10/2021 04:08, Dmitry Baryshkov wrote:
> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
> as in this path the IRQ resources are not allocated (and thus the
> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
> that the IRQ resources are proprely setup.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please ignore this duplicate, it was sent by mistake.


-- 
With best wishes
Dmitry
