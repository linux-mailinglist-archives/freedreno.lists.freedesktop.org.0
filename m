Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2639A6C25E8
	for <lists+freedreno@lfdr.de>; Tue, 21 Mar 2023 00:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E4F10E680;
	Mon, 20 Mar 2023 23:44:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C59A10E680
 for <freedreno@lists.freedesktop.org>; Mon, 20 Mar 2023 23:44:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s20so6667765ljp.1
 for <freedreno@lists.freedesktop.org>; Mon, 20 Mar 2023 16:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679355840;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pUisDYyem0moEyMsi7OmN9BV8ksdlhWL4im6qzykGqo=;
 b=ec3Vi+kBbqwkcsa5gMLWQ/YjN0/ALebMXzTen3r363FKQwExlHebnAU2RlgU6uf21e
 mMgaxGVhGvgN4dCk+e+Xm6CDk+rPc+fbld2bi3UOqfElEDGtojGm9j4EwoT0sO22kcgQ
 b57KUS/wLOw/WY4URwJAoRAhuBwWmOJgjm4JhcarEN+/tT5Rfbt9C5UpV8gcVAfuN/x7
 f36aJeSOVu53DivXyzLEp9bMoHEugaCHZHOqN6nnmX8D/SlFgE1xX76SLP6WGAcDw0c5
 aQ8S5bRLaonWSOziT9dEUCfy37+KBXFreJA673jtQ46jrGZJcSGXn47m8BRC3Ab9vqp5
 L/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679355840;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pUisDYyem0moEyMsi7OmN9BV8ksdlhWL4im6qzykGqo=;
 b=1bVkUWRqejwoE4YO73PLidJQKJtfXHsgR4GdbrP9nBLAyjoN8JRwuUcBK8U6MKzt+e
 QywJQWwDj/fYXcZDVw0Xo8ZjVyXXNY5w1xF1H6ysVv3/sJVODyZGO/2ZvursgOGUYrDj
 iynlQE3PcbHSGgtvXgIaPnPZiMy6xRkpRpR0Rgdpgvmr3EMjBmEwL/LbDD3IF6+6rn1C
 uLgm+PsrkURDwnOfzvvtUu3eAzt9HWdrm1EY6s3vHTUaLJeCVtOwm19t2jmohjhyRx5x
 innQzdGO02g73pAEFwk6+YOAq6Y5ZO6fGamI/IwoltvR6rWa6YzSR8DC2b5iCp9gwKNd
 6Zdg==
X-Gm-Message-State: AO0yUKW3eJwsf+MwoXhqP3ItbK1I+JZHSOVkqplG6bCnXQ67gSB7oo+9
 ypO/Tdbj3UGCGBzu0yyLBMkUtA==
X-Google-Smtp-Source: AK7set/CUVG511vxdNGrjJFg92az0rxsvujqZY1Ww6UtM1d+6WsjMZwZsO0DznoMn77bTyFRzRqQqw==
X-Received: by 2002:a2e:3217:0:b0:299:8859:2433 with SMTP id
 y23-20020a2e3217000000b0029988592433mr234016ljy.38.1679355840183; 
 Mon, 20 Mar 2023 16:44:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a2e9385000000b002959d2cc975sm1970614ljh.37.2023.03.20.16.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 16:43:59 -0700 (PDT)
Message-ID: <f8562f64-b988-6f3a-b501-5d874912175e@linaro.org>
Date: Tue, 21 Mar 2023 01:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Leonard Lausen <leonard@lausen.nl>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <ae78354e98b719c1fc9466d5965aea5a45ac29f6@lausen.nl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ae78354e98b719c1fc9466d5965aea5a45ac29f6@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add support for AR30 format
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

On 18/03/2023 21:45, Leonard Lausen wrote:
> Commit da7716a249b699978fb5 ("drm/msm/dpu: Add support for XR30 format") enabled
> support for the 10-bit XR30 color format but missed AR30 color format.
> 
> This can trigger bugs in userspace. KDE KWin compositor for example always
> prefers 10-bit color formats, rendering a 1cm^2 black box around the cursor due
> to missing per-pixel alpha-blending if only XR30 but not AR30 support is
> declared.
> 
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

