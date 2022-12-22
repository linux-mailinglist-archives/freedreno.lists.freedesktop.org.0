Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B94654076
	for <lists+freedreno@lfdr.de>; Thu, 22 Dec 2022 12:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464C10E11C;
	Thu, 22 Dec 2022 11:57:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6327410E0D4
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 11:57:16 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m29so2357326lfo.11
 for <freedreno@lists.freedesktop.org>; Thu, 22 Dec 2022 03:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ybQ4Whpa3SpP761yeHUxG3tM4xYXNTJUdHflhRn7YU=;
 b=zQUQj35lOnAY8gpRut1fU2rTLaWFGfMggPAUapYo/N2I7D13sgT5R5wKR7FDaB/dpj
 kJt3nTSsGyZMPA0F0JgJlNhQcs3hdqqPr2QEVWCd41qX5fsyaeqRrXrtpSlzllfcelgi
 mHYr2Li7g4Y/+ccNMqAhlotkMT4IHXqIH0nOepEP3cqnDnpBZ2757w2A+rw9BxH7XuR0
 a6J825pLQyp7Vxg6DJeeB8s6UZjnk5gLv5Xz06QZsGjAfxV4BdidmbWVeTOsKQRt+to1
 NGHvpUc0oyL8r+/6DmMqwnml3MfQW63FsVNKPuaTlBOLPDbx/QwV1K42ASroe5IihxF2
 Nx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ybQ4Whpa3SpP761yeHUxG3tM4xYXNTJUdHflhRn7YU=;
 b=qYNAABxM5ErbYUtJ9KA8THfdLE5RuviPzU60FWd/91AYilWatDdkpIERqGnhD2LTr8
 Nx/ZLs2eXaje/M7qQb1fdDbwUNNxRZ+0UXQMaukZ5kQdNjfDz9BIyc3VTqGhSltDPdCd
 K+QCracvIQtmmq5rewJ3uoeJKIcAyJCotssFNi3UpnhiHqEZQP9XsujbTAKQJqIw7YWC
 BfCVixKXREHTXbUNZNfZG0gQWpQFwE7iTDJnvImZGOIosWcACrBpnIEpC5VAa8wB6xtX
 LI9EEPbGm8ql4crD7jy6ztgGdkQcQZvfZbgAyhtHlvKqlpQPEa/gpnDEr+g/ymhcPtco
 iodQ==
X-Gm-Message-State: AFqh2koIavIIKLemu2qWJopRZOTaW2X4GStIzLaZbCCpty1oKA4EEPpJ
 LshfOTnMVcWeywwOGmKRyCrQsA==
X-Google-Smtp-Source: AMrXdXtXval6G4cxnlj44j4xDxigyTVVNLo6CuavcrR8WiAMsxtzmsn7MTcmxS5ivayE002kYlqRVg==
X-Received: by 2002:a19:490f:0:b0:4b6:2bba:923 with SMTP id
 w15-20020a19490f000000b004b62bba0923mr1412758lfa.11.1671710234800; 
 Thu, 22 Dec 2022 03:57:14 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a056512070b00b004a45edc1de2sm45382lfs.239.2022.12.22.03.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 03:57:14 -0800 (PST)
Message-ID: <af21dcff-9bfa-8a12-a307-ff9adbd59f2b@linaro.org>
Date: Thu, 22 Dec 2022 12:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
 <20221220123634.382970-10-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220123634.382970-10-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 09/21] dt-bindings: display/msm: Add list
 of mdss-dsi-ctrl compats
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
> Add the list of current compats absent the deprecated qcm2290 to the list
> of dsi compats listed here.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdss.yaml          | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Is your patchset bisectable? That's second place where it looks like not.

Best regards,
Krzysztof

