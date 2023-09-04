Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7806D791AD4
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 17:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAA710E389;
	Mon,  4 Sep 2023 15:45:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0338610E389
 for <freedreno@lists.freedesktop.org>; Mon,  4 Sep 2023 15:45:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcb89b4767so23859131fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 04 Sep 2023 08:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693842335; x=1694447135; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0+GlJFHzb1D3XDHeV2FI4PvbcaPkKqun8UbiQUvz0aQ=;
 b=GaqlNqot4UHE9tD2Io7wBw2SnVaWPBMbfImt6YpfYjh+iMhipeZnZvOAtKuTBe37ml
 wTb7OVwcFufPfnD7XGGdL9G6LTG5FfC33SeJ08NBmk101EOUkYYDOXoJR2q4DDYWgxOl
 jWT2QL9kEA/JRfO+6w3bKIFKn1Dtf1NcKwS+QFoLLo7/3IBcaHaueO6hdLUJGIfnDQp6
 y9SW6sLznBGfDqTWGsKV7vHFHr4F/4eLPqyPmeqW2YfBCWPtm/3mxZHh4wNF72oKe+uB
 IX03/1Wsi8WyEC/qw6E7HIkzfIOqg40EK0IR0qvTxXxS+nVLZeIB4bq/lS3A7yJInumi
 zc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693842335; x=1694447135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0+GlJFHzb1D3XDHeV2FI4PvbcaPkKqun8UbiQUvz0aQ=;
 b=UoQIW4og/OKoEUJbqjEeCIEMJaFDMHwlYcTTz29hzDChl8Mf165PyVcFZMKyNFSdW/
 EErXXGliHOqYb0TNdaOCBH1QAqS2tBLwhx5mh5o3Lj+6xOfBiQcHQDHIIiubh3+c/uC5
 ycIrLnD297pUA1X93+BmZdZN5cp1SG2+CQOcbCvg3WTcL6wDpByWWs1NG+owiIITRarG
 v9lnbt85+o9tNgfVN+NpB8TlrZEHAJS3T/B+E29g72YT2DCVPU9p1xvAVlCL/rBu64y+
 1YTOkuGikcXCFp0sS60vXyyeYNwF7/1prWujPUfSip7JOFw3b2Fs5vqCwdgLP7xDd3hX
 8S8A==
X-Gm-Message-State: AOJu0YzUPSBzcZAFxo9G6q2t5BoYiQzw6KLKvCmyAoNffd/JXp6KVBYq
 Pe7Tco3fIWptRfiWeORExDVQsA==
X-Google-Smtp-Source: AGHT+IGjTokOv/IDyhswVsXI07leRAlQxYi93jO33A/nRd/LVlk/Glx/WNgORnNOdsXYPsYI1hwazw==
X-Received: by 2002:a2e:9c99:0:b0:2b6:eb5a:6504 with SMTP id
 x25-20020a2e9c99000000b002b6eb5a6504mr8087643lji.18.1693842335157; 
 Mon, 04 Sep 2023 08:45:35 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 17-20020a2eb2d1000000b002ba161bdc9asm2181266ljz.79.2023.09.04.08.45.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 08:45:34 -0700 (PDT)
Message-ID: <c078ba24-df68-49f9-b38b-0ccbff493a25@linaro.org>
Date: Mon, 4 Sep 2023 18:45:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-8-dmitry.baryshkov@linaro.org>
 <skpvgxdkyciuijkv55uh4ircrrarqhdoiocqc6h5gs4dw6c2rj@zv4fwdri4mwz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <skpvgxdkyciuijkv55uh4ircrrarqhdoiocqc6h5gs4dw6c2rj@zv4fwdri4mwz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v1 07/12] soc: qcom: pmic_glink_altmode:
 report that this is a Type-C connector
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/09/2023 18:43, Bjorn Andersson wrote:
> On Mon, Sep 04, 2023 at 12:41:45AM +0300, Dmitry Baryshkov wrote:
>> Set the bridge's path property to point out that this connector is
>> wrapped into the Type-C port.
>>
>> We can not really identify the exact Type-C port because it is
>> registered separately, by another driver, which is not mandatory and the
>> corresponding device is not even present on some of platforms, like
>> sc8180x or sm8350. Thus we use the shortened version of the PATH, which
>> includes just the 'typec:' part.
> 
> How would a properly resolved path look like?

On RB5 it is 'typec:port0', as the USB-C port is registered as 
/sys/class/typec/port0

> 
> As with the other patch, I'm okay with this going through the USB tree.
> 
> Acked-by: Bjorn Andersson <andersson@kernel.org>
> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry

