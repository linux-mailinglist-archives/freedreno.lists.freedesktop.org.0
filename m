Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D674C654081
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 12:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4D810E514;
	Thu, 22 Dec 2022 11:57:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D6210E51E
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 11:57:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y4so1649572ljc.9
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 03:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xDC5xCKfkDa/LgM6w3krjqzwgZw98EUeXEhxRPwXjAY=;
 b=HySmqpo4d05os5Aqbd0yTRiPgZA40Rqz86blpJG8oF9ARciWS77jnz/uqGywbxaXU1
 FYobQi+TsRrrMzIKDoBM7lf1ePuixuJFkYsDuHMyMXLT4YE/6rLJMVnT/ngjp72CaoI4
 HVgkUnuCKbrnTvxVwiZjZIKlTXdCFCqQRNvHFqvWLhu8fnkDLED3d97oMJn518g45wpH
 4T0ptVE5Kg9pYO2UCGe6DafpKb9/12fb93EoWAbpHtVuvDb54KJ+xk3m/1DwRtTu5efd
 QMh3qOkjBS7yeIdboDA23WwrDVSRLXVYI9k4iyKyjFXGGeS32W8AL3xK7LL6XnvMjow3
 aqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDC5xCKfkDa/LgM6w3krjqzwgZw98EUeXEhxRPwXjAY=;
 b=ZzNxz2WEl+Acw3lnOIVct7CGJvU4sHgmKMCJdNL57g1B26Te+fnkkJQArQhA/0mefa
 tSvJiK39uPQfqapRc7kuG32ThqZfi4NuCBTXSzf4ZR6fmXMp4KjMVxjkrCA11/eThJ4O
 Ij/l4AUUhq7Ul/dUBhO+jrh1qu4irYurPQKOoSce9ZwidfWarrsX+8GnKSJ2QtYF4aSN
 h3oW+Ifbj1smqsAnpbQvWXiK8unKdXdkvUGe2x+cjH11RsaLYuI/i55bl8BO7V3ZAx9p
 L88JMXnGeGBjNwH5emiDM8b/zWuyFncBji9hFaDn0aRaRChtbfHgSftElVu1kUUNhqRo
 eLRQ==
X-Gm-Message-State: AFqh2kpfiveNmCiM6YXngW0frhp8Wx100W1dlF93qZb8gvV7MxNztI5n
 UKHz9MBXk2H7zM+lRM12Tm111w==
X-Google-Smtp-Source: AMrXdXuDLZCR1aKFnCjSyyj+uMWF/mFNPNJjQEVkOD6wR4u7x2Pirb7Qf2RMA8Cwez0TSlfJOHFB+g==
X-Received: by 2002:a2e:a26c:0:b0:277:4a25:7ccd with SMTP id
 k12-20020a2ea26c000000b002774a257ccdmr1461554ljm.53.1671710266657; 
 Thu, 22 Dec 2022 03:57:46 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 17-20020a2eb951000000b002777a07f48esm29267ljs.12.2022.12.22.03.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:57:46 -0800 (PST)
Message-ID: <0193f5fd-6f79-3c56-d16f-465119d3d3db@linaro.org>
Date: Thu, 22 Dec 2022 12:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-11-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-11-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 10/21] dt-bindings: display/msm: Update
 MDSS dsi compat strings
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robdclark@gmail.com, robh+dt@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org, airlied@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/12/2022 13:36, Bryan O'Donoghue wrote:
> Several MDSS yaml files exist which document the dsi sub-node.
> For each existing SoC MDSS yaml, provide the right dsi compat string.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Same concerns about bisectability.

Best regards,
Krzysztof

