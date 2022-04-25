Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA3850EB08
	for <lists+freedreno@lfdr.de>; Mon, 25 Apr 2022 23:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4188E10E1BC;
	Mon, 25 Apr 2022 21:08:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2648210E1BC
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 21:08:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id x17so28463358lfa.10
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HeAipw4zYNeia12j7XYVHYU9J94Bm4xqgnpreAQ+Qzk=;
 b=bJuLeSOBykWi8VGrKRwylfeefE2eR9q7qefiHN/24sOZYASDOB9zymZS0eZbwAsheU
 Gn4212dpt17MZcEosVxxHQ1QU71XN3nv/dW+3Sgz+L/ZmBsC+H8kYSSCGKgVux/H0RZJ
 OlHI/3SxclyA+rX2bf47Vrd+l8jqMnjmfHjFL8evdEp77DNfVFCA6pbb7dQy/DGPXKYD
 nwXorNKIEOk5/vOMCoxziHmqaFKWA8YpmSxLjZ6iywDpExXO33x6Yq1p/nXkMzvdwhtS
 +Gf4v9krns0rCYdVYEaZ+LAnv+gS0yE48Kitf0Icp0BbyPAXL+1aXCkrteqcXE8WlyRA
 ZNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HeAipw4zYNeia12j7XYVHYU9J94Bm4xqgnpreAQ+Qzk=;
 b=iq557O0eayC68YiWdRiN+GhY1Ji4ZxI4TgiPA1HeFI565nw31vzfJdxqjpESh8oTfy
 smsf4AF169AgawpKF1u72ugPJOq0IlIm+HFNbNhRJWNdH4zseT3dX4yIcnolFUV8x0cy
 oB3tGK0VzDbDrBEk61ECB0nlubP70xmoTN0Le28P6rh9nJBA42tW4glU1+T0u8kxhBVy
 d98zp2ZhwkmfKjLL0ackJ7I70kLSt7s95vPxktw7RUjjmlOxsHB5veBoc+7+JcyCcKlR
 oboa7b2pP4ToXsThEkbGWrRMWV++27YKoWzbSfeKBJwdOAW5TzAnjQS/cNQlVBu/l30u
 gIFw==
X-Gm-Message-State: AOAM533lLB3p35pMTy8GVnaLDfAFY3g85bx22rr/15++qvQ6ZkyRs68R
 pSo0uGaSZ+9bpbIKsbkom6Mubg==
X-Google-Smtp-Source: ABdhPJwa4PWVY0l1RBVql9YpM5TgtmLWxVWf1CxtDSxCxju9pLQGfESguxQXkIRMvWAE98kugzeAgw==
X-Received: by 2002:a05:6512:239c:b0:472:3d5:7e77 with SMTP id
 c28-20020a056512239c00b0047203d57e77mr5600455lfv.448.1650920904365; 
 Mon, 25 Apr 2022 14:08:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a19f203000000b0044aef0e60d5sm1528696lfh.210.2022.04.25.14.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:08:23 -0700 (PDT)
Message-ID: <517db2b8-6be0-2f2b-f98e-ca5ca27d0603@linaro.org>
Date: Tue, 26 Apr 2022 00:08:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, cgel.zte@gmail.com,
 robdclark@gmail.com, sean@poorly.run
References: <20220425090947.3498897-1-lv.ruyi@zte.com.cn>
 <CAE-0n50fs1fFQcwMCq_x_UG8ZJKprjcYKwcy1+1ckD--XE28+g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n50fs1fFQcwMCq_x_UG8ZJKprjcYKwcy1+1ckD--XE28+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: fix error check return value
 of irq_of_parse_and_map()
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
Cc: architt@codeaurora.org, linux-kernel@vger.kernel.org, ryadav@codeaurora.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, tiny.windzz@gmail.com, daniel@ffwll.ch,
 angelogioacchino.delregno@somainline.org, jsanka@codeaurora.org,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 skolluku@codeaurora.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/04/2022 23:10, Stephen Boyd wrote:
> Quoting cgel.zte@gmail.com (2022-04-25 02:09:47)
>> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>>
>> The irq_of_parse_and_map() function returns 0 on failure, and does not
>> return a negative value anyhow, so never enter this conditional branch.
>>
>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
>> ---
> 
> Question still stands why we can't use platform device APIs.

Let's do a separate pass and replace all of functions with platform 
device API.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>


-- 
With best wishes
Dmitry
