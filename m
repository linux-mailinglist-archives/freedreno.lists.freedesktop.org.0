Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC7661A79
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 23:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE9710E048;
	Sun,  8 Jan 2023 22:40:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A657710E048
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 22:40:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bu8so10378189lfb.4
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 14:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=04VPxodDj8VYqfXc+AO5iDAa0bDV0HeRkmLR4Sxbnw8=;
 b=JGxoURkoihHFPGzdeL7AT0d0bJ+n0BJwTiUFG0q0xP758klKGYT7KZFxCbvFd5XxC9
 Tsqd97ZaxIgAMko3zqiKWZx8kAMEtpURZEkYGavS6nNFcuHa8zLOAZAj96aO2FIDpKu4
 PyBpgW1+YDBtkPtuDb02rPqv0LO4QIeaXA+m76hD1Tdp2VhE6uqU0YzhBxAJH9Des4Wg
 romWKqe6fyeLJYY6nLRCnaosA/P5eteRiRZvjYOMAL0X0cuXVlu5+jR3tcHZ2+iYt43W
 RyTMm14xjqSGaHgDUuq5L1nC/vPe+Ql4AFuFe0DtHfvxLdpE8KKb/FcKoRAX6Xf438vZ
 uSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=04VPxodDj8VYqfXc+AO5iDAa0bDV0HeRkmLR4Sxbnw8=;
 b=43hwaiJgjBDCHjJrTh84NNaFazLTh2TQ4a01Zy8CozGT1q+JftH0q5UAwRsCbXRsp0
 +tpAtRs9zEeylNzC11vExkZdGhRdeeqFV4Ycm7+KtjSlW1IG/ApzJDszVIdwKoZd2hvz
 19aPh2uQxVSvxi1E67hmEHwkIcxc9yKPHii8uUlSRFCRUByEypnmDb6Ovw1zlS83cqyq
 IZBu23wa77ICmJqyyj79F18gTG9A7p01bgCHcfcQzpl6qvd1VeLf60/FfBQ65xAlfE0T
 rJe/VRr4m8k2vxXOygJHEgErPWZqDzI0pTVAXlyBRs3vEfwdX9P1HXOssncROERfXkNF
 hkFQ==
X-Gm-Message-State: AFqh2kq0vmgA1I2sQBF4JZ8F9NdBL9I3ER1WIom1F18/7CjzZBCG+rB6
 GvMvhB8Oa79nuCKUQiV7HRLE3Q==
X-Google-Smtp-Source: AMrXdXsYBiFkCm6HkGiZyLtZo4tZyRsq3YwGKIk3T/55haEfYPzQzsx4FvI2H0FaYtQAIQfOSd/7dQ==
X-Received: by 2002:ac2:5318:0:b0:4b5:7720:5fe4 with SMTP id
 c24-20020ac25318000000b004b577205fe4mr17346875lfh.67.1673217654007; 
 Sun, 08 Jan 2023 14:40:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 1-20020ac25f41000000b004b590b0c084sm1253296lfz.3.2023.01.08.14.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 14:40:53 -0800 (PST)
Message-ID: <698a7082-84a5-b805-3e7b-9c72810580f3@linaro.org>
Date: Mon, 9 Jan 2023 00:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, swboyd@chromium.org, quic_khsieh@quicinc.com,
 johan+linaro@kernel.org
References: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230106023011.3985-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/hdmi: Add missing check for
 alloc_ordered_workqueue
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/01/2023 04:30, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference in `hdmi_hdcp.c` and
> `hdmi_hpd.c`.
> 
> Fixes: c6a57a50ad56 ("drm/msm/hdmi: add hdmi hdcp support (V3)")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

