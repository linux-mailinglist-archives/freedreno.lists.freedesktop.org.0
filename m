Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E51839679B
	for <lists+freedreno@lfdr.de>; Mon, 31 May 2021 20:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9876E82B;
	Mon, 31 May 2021 18:10:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F74B6E82B
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 18:10:22 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id c11so458934ljd.6
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RqDyoSo09lPZO7GbOVPgOTHVdV/YSSWYh+JNDnVcsAM=;
 b=vy0uLjUP4b9/AdZSWCBIJkGYi4KqsFzlAguK9G1kq10RuG2QJ9SaCin/z40CAuN9N1
 Ny/vrCiMNiRFhNLvJpQsZYZINHFf3EaQct9tsqIhk5tAUsuxyy09Jt+MFTo1pb2DxMnI
 1mhuGM8ZMFNvXLG2phlK9NzBPLb3Sc3JtSvvZKZm+MyP/a9uTs2m53y9gSdGz1FPy9Zp
 irfZkJPLzEw5eyrLgj7PQlgSEwbb6I7tSu/8WspO4dXuoX2ho+xANIhvHef5g176dFCi
 3lou3RZZLIaFfJeZfbA0ikQgl/ZH1MLhSjVh8yTZE2in8m24BXFIdgP66V1SntHfTsA6
 U1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RqDyoSo09lPZO7GbOVPgOTHVdV/YSSWYh+JNDnVcsAM=;
 b=evyXFLIUFhCmm4WdN5TIYhTsjeiM811RT36ZraEe2Ekk6egk0RXxTTcLuVdN7anZ1s
 MnKFI2DuulACrVpWXIDcyJQ8MvW6VWbnehGbhtH1d1KESX9mKL9+EcxV5N2GwcbYp8pV
 4/kaBteEJ7ig73f6Ciu4PVAi3sSvOHZ+aUIO3tUCxPmv6TkfqBbTc1pyKZ7BYJAzmNxR
 r1m8Vidd3o7KL+4Udykwq2WAVDWW3zNor6BkVmhO4rJRO6GXOiE02mDve/HvP5boaxu0
 bD//PkE/+5M2uDEwLIqDC6j0lKb7dykoKaLnlvEG1R8ktOmlvtPOf/6CcaBKtzQbhf+O
 Fx9w==
X-Gm-Message-State: AOAM530OV9f+ZRjT9qq0nwPPr3xwYrwKEzU9gjZBlwDzNlrKT9L4glAW
 0Q11XsB//mu2DwSZe3ti5NoNiA==
X-Google-Smtp-Source: ABdhPJx3O6rn5NqZMzkPeijKZJM/6wPEQfnrs07M3tXIRXQouQa/sGsKJEEBs84ooxP684SBQE0Vag==
X-Received: by 2002:a2e:bf20:: with SMTP id c32mr17459713ljr.311.1622484620655; 
 Mon, 31 May 2021 11:10:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y1sm1331962lfl.68.2021.05.31.11.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 11:10:20 -0700 (PDT)
To: Jonathan Marek <jonathan@marek.ca>, Rob Herring <robh@kernel.org>
References: <20210423172450.4885-1-jonathan@marek.ca>
 <20210423172450.4885-3-jonathan@marek.ca>
 <20210503171139.GA2011901@robh.at.kernel.org>
 <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <4e623554-bbe4-4d4a-7b14-0ca4f684c7fb@linaro.org>
Date: Mon, 31 May 2021 21:10:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
Content-Language: en-GB
Subject: Re: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm/dsi: add
 qcom, dsi-phy-cphy-mode option
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/05/2021 15:57, Jonathan Marek wrote:
> On 5/3/21 1:11 PM, Rob Herring wrote:
>> On Fri, Apr 23, 2021 at 01:24:40PM -0400, Jonathan Marek wrote:
>>> Document qcom,dsi-phy-cphy-mode option, which can be used to control
>>> whether DSI will operate in D-PHY (default) or C-PHY mode.
>>
>> Given this is a standard MIPI thing, I think this needs to be a common
>> property. We already have phy bindings that use the phy cells to set the
>> phy type which I think you should use here. See
>> include/dt-bindings/phy/phy.h.
>>
> 
> Is it OK to simply change the option to something like "phy-mode = 
> <PHY_TYPE_DSI_CPHY>;"?
> 
> (using phy-cells would be annoying to implement, with no benefit IMO)


To add another feather to the balance scales:

- `phys = <&dsi0_phy PHY_TYPE_DSI_CPHY>;` would bring knowledge about 
PHY mode to the DSI host (which does not really care about PHY mode)

- `phy-mode = <PHY_TYPE_DSI_CPHY>;` would stay in the PHY node, where 
this information belongs.

-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
