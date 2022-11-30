Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E1663D8AA
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 15:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7080510E479;
	Wed, 30 Nov 2022 14:59:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5E510E479
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 14:59:43 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id bn5so21181946ljb.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 06:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+bZZiGsvCviYgOuFBF7njmiF2RANtTpinOFAwCnqSCA=;
 b=eg9BgddOl8Bn4tGtBcVcfYO7bUO8yd1eBz2ZBDcugmKd6hMl5F1Llxm5IXX9Dv37Qp
 4fNhHLmZBMoeGOrw9YHbvCeFDXo5jEO92pvUDdDbGWBdo7O7dkmmnp+L+d5eolfh4L2J
 0m1JJbT19p2jdk17CsxeU0zygr9t66ARMOIQ42/8xVeduVQLsoXIM3o9gbzsSgJKsF3W
 RiHtiLFF85+Qcjw/L2wh7IWX0xHh17uHZFqqpnbhi/BhjTaauIA2YfWmh9e9KMrU67TS
 2PCT3n8HR/0I1vzTCHssMYTdVB0opZqF+TTFcUHKetDK7FLcPMwZg/mXAVRlqUpq3Kq+
 pVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+bZZiGsvCviYgOuFBF7njmiF2RANtTpinOFAwCnqSCA=;
 b=VchVovLbO8XBDF5YNURo/znMvU9E7iG5xP2q3EVUWBUhZKVDKzfa9zCj2JkE9TFGbt
 NFclJ3HtLF4KoCI4B9kdKnp/dMBL23gbBLTjKuLBcnWHSaP7OzNzDM1mDULYugFmYUKo
 +Ox+5lUG3X8HsTPcOHiiVg3SGSdzwMcvzrd4aLF2If1OWchQUkEKq3yf5D0ACgHupVYr
 /eg5PAor7eWqV3a8esk6rXE+q/bYTQdD5ccGAkreWcqs1WeU7J2VMTE2Zvln/6ZhGJHO
 sOGhJ7urtJ5CKU7iNESD1AgunqBw4DJvBfB/paWma1u2xYEaePYVVAXtbW9ArR8bB+Cu
 PPlg==
X-Gm-Message-State: ANoB5pkKO405xCCcYnBVg9jLhIy+xOF/dN6Jn7ht0QVm+KpfyhVwnwCz
 dk/inJVCcOLk88MLIQ+Jz/bGzQ==
X-Google-Smtp-Source: AA0mqf4QWLRswl+fzVjdtAM1h2hdO9aXmxVDwI9Rklz7Of6iQt/IqJOKUAFZJPhb5iE093B2/PPRTA==
X-Received: by 2002:a05:651c:1101:b0:279:73ba:8719 with SMTP id
 e1-20020a05651c110100b0027973ba8719mr12448536ljo.294.1669820382117; 
 Wed, 30 Nov 2022 06:59:42 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a056512202c00b004b4cbc942a3sm286091lfs.127.2022.11.30.06.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 06:59:41 -0800 (PST)
Message-ID: <99671b3a-e99a-0a94-38f2-1ffa70339a15@linaro.org>
Date: Wed, 30 Nov 2022 15:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20221130135807.45028-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130135807.45028-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: msm/dsi: Don't require
 vcca-supply on 14nm PHY
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
Cc: freedreno@lists.freedesktop.org, patches@linaro.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/11/2022 14:58, Konrad Dybcio wrote:
> On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX line, which is
> voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

