Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918F562370
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 21:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43A911B360;
	Thu, 30 Jun 2022 19:49:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A00410FF50
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 19:49:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k22so94568wrd.6
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6tnKa6j0KUTAns+9a5hu7e9HMdmQnDavnOA9sl0AIJw=;
 b=njyHn6aTwltxlDIvONhFpvjWImdwFbcxV+4iHtUnmq17Z2D2qLtMXnUyw7I1zpOZX5
 DJxgodxX1pg57tqiCqKtVwDfitRIWbUeosHao0kCyMemcdLbpQ3gGXS60ftMr+swK8JJ
 XMbvAsyvlDTGVU90VTN5GrC6vkMNEYQ/q4mggitoR4nitzTuHo/T3rZP1vssev6UBIIU
 BKAyX9cpWILuv8wkR2dFcpXCgNnprozdL9dJlDrMYfu8fNOp0HKQa5Uxng1lC5nvpGn3
 cVRnQUfVNadjAkNMpjM/UY7fmJp9eqo+8jJ4lmupI90NHghoS7YhHqbbYZ5zWQbA/B/s
 LLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6tnKa6j0KUTAns+9a5hu7e9HMdmQnDavnOA9sl0AIJw=;
 b=OurNoYi2eaS94xNpXYmRK045//BNayQ+ukg5ddcwhsACOxpUOThg4Fs5FlVHN2izHC
 PBe9J2vk5xnbuDklNsFWioZc0fEhBsRJxJ4/QgX95tFwCVa2ofPm+u47dUJSDFsk0th1
 qI6aUDVdWahn15kYXF9+aiUlXJBJtsYgHUNzVm8daIdAKsp2Pg/3IRcOJnFput2MwvMV
 sOIGSv7phRrAQHkBPSl2ZuB8W6mzbQE/te8eUxpUXuRiKVtsJxyiZ3TDoyEEJlSIm1JP
 dKTji22JNC09ahRJGxqmWqltg4bxn0lXKBzPmZneEkrlCkMkO/I2p8dNoSxImr8UwjAX
 TY+A==
X-Gm-Message-State: AJIora8iGFZn++6KffiYsgn+JIe7tMQy+/gsxGg90UQNCchYfjFTG9Cn
 0dxf29xa15A0iLtWMUtB/kz1Hw==
X-Google-Smtp-Source: AGRyM1sZHMnJrHelAuAUGs13a3YkMH9sihf7xkfePW0UaKfmk8KPRg67Ro+MceNbycq1UCObq1QnZQ==
X-Received: by 2002:adf:e252:0:b0:21b:827e:4c63 with SMTP id
 bl18-20020adfe252000000b0021b827e4c63mr9834152wrb.307.1656618544868; 
 Thu, 30 Jun 2022 12:49:04 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a7bc4d4000000b0039c798b2dc5sm3634442wmk.8.2022.06.30.12.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:49:04 -0700 (PDT)
Message-ID: <054043a5-3643-aa5b-4204-8cacb7b3ae9a@linaro.org>
Date: Thu, 30 Jun 2022 20:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
 <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/7] dt-bindings: msm: dsi: Fix
 power-domains constraint
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/06/2022 20:01, Krzysztof Kozlowski wrote:
> On 30/06/2022 14:08, Bryan O'Donoghue wrote:
>> The existing msm8916.dtsi does not depend on nor require power-domains.
>> Drop from the list of required.
> 
> That's not good reason. The bindings are about hardware so the question
> is whether being a part of power domain or toggling power domain on/off
> is considered required for the DSI.

AFAIK no but, I will check this again and if it is definitely not 
required, I'll churn the commit log to describe it better.

