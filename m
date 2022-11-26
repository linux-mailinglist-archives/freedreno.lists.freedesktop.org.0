Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910F6397EC
	for <lists+freedreno@lfdr.de>; Sat, 26 Nov 2022 20:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD5210E179;
	Sat, 26 Nov 2022 19:01:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF5510E168
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 19:01:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g7so11532982lfv.5
 for <freedreno@lists.freedesktop.org>; Sat, 26 Nov 2022 11:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=npduQyctwPNwbrvgK5EV990wakFndbnwODmRKUwPZ0c=;
 b=YYDXJrlDz5fAunQJeW2HJc+UnzJx/7HXQvjdVLpMqfp+JXxPYtLlQFHrlg6y7kRps6
 IuglpHw3CwIRW9cheafiCbS0cQM7tPK9hLvxNxu2dJlFMcRG/ZsOfa+EyMu2An+INn+Y
 nJXA7ftESS/os65D8GZ5hujNTqO1ykODmF1iSvkVtXN3a3ajQdtkK/VU+JOZzinjzcA5
 oDxnog4o9hud04y8TNwvgQkyYAzC7vHiSmiFPcBan94w71ie+yTcgsxY2fNl9K9pC5yw
 UDoIlGN4w17bVxjOLFTRV5T+lTKuzALe8j27brPecExBLVEfBknj9T0vlYTGADAUSCMN
 8Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=npduQyctwPNwbrvgK5EV990wakFndbnwODmRKUwPZ0c=;
 b=l573ZXipBikF2OnpINfjM7gsNE4TmqfVfsQ7szgEZ9stRbHAh3jyXs1s/ioGrKT+Ld
 fhhwOuVtg9lvrFuI3qeUuVVqNbppCtQf6ajC5AdAzX8rsfpkmPFVf5sdt1pPH/OFpUrg
 mfZyVEblXBG/3wqtO2sHRC2b1IXxhL9+55d6AjftDuPZ4g14XGBV+elGD5g1YkIQ3qHA
 5KIacBCA8O1baAN/G3qOMAXx+bvlminSYh9fo+jrrwgs6XiE0KxB/TRkEvuhabLQOc9Z
 gEd2PeCqNOtIJPVAP4iS6j+RO8ywaRshsDHW6dOCrJ9ODlAnNWIH6jZNkSF3EhQ0OSic
 kE0w==
X-Gm-Message-State: ANoB5pld3nqpoOEYNE24heV4UxBlsRiWYdBSgdNYGl26U9/t9fBU7YBC
 4dJUpL7Y1R6UUmeN4BG6VUDkdgzSo177mg==
X-Google-Smtp-Source: AA0mqf6tuqwwCF6uoWwBZbyez9jbdMM/tWE0H2vrRLPARhOE6xVIfLJNfMh/ndzgO9UGY1vq7OUfaw==
X-Received: by 2002:a05:6512:2a89:b0:4b4:dffc:62a8 with SMTP id
 dt9-20020a0565122a8900b004b4dffc62a8mr8007174lfb.585.1669489304609; 
 Sat, 26 Nov 2022 11:01:44 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a056512052d00b004b48cc444ccsm1001380lfc.100.2022.11.26.11.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 11:01:44 -0800 (PST)
Message-ID: <a6a65a81-1f37-74b0-6bd4-df8ffc6d28ab@linaro.org>
Date: Sat, 26 Nov 2022 21:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-15-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-15-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 14/18] arm64: dts: qcom: sc7280: Add
 compat qcom, sc7280-dsi-ctrl
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
 swboyd@chromium.org, airlied@gmail.com, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,sc7280-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for sc7280 against the yaml documentation.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

