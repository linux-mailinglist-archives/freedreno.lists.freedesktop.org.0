Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED6E71983C
	for <lists+freedreno@lfdr.de>; Thu,  1 Jun 2023 12:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C8D10E54A;
	Thu,  1 Jun 2023 10:03:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9078910E544
 for <freedreno@lists.freedesktop.org>; Thu,  1 Jun 2023 10:03:55 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso1069460a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 01 Jun 2023 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685613833; x=1688205833;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WO8KsaywxjcSX6U8BECoCcVISsSXERYCN/AYt3V86VI=;
 b=j4S5kWdl3VRytOmeo3nxkdlw8u0wFF93pTVOptBBi9qTp4Ot0KOb5bcE8MoFv93bRY
 sY7h6/H9zu0Zu+2QXm60OrPcq0uvD8BnQRftgyD5ZikvnJK1ricQHhKMVzf4z8KPDqCO
 6zqeqiGYZmmL3g2MnLrqGBsprMfe6tnMXGOmb6TpZHGs5mGLcvs4S6mAPUI84TbZ6ed5
 GO9M6G1SBQ2iV2Kbwnz+JlB/rJRkmmv6ZsAlToqHh+f+AsHxcuyPo4RU55M7a6WvLVun
 LJg4TZ+p8qu6yH1IEYFk9CKwICZ+7E8YbPZjKZCcnY9EQaKdtonjIB7OrvaAqkSiHJsP
 a0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685613833; x=1688205833;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WO8KsaywxjcSX6U8BECoCcVISsSXERYCN/AYt3V86VI=;
 b=WqPdu1tDXIIhA46H6iq6mRAnp7SNQmjZpfDnEtcxW9vaR/KhbaDm6BqBhzx+l+k0No
 ee7hePIqa7QbJoLzbSWkSJBNINW8VdBVip01s1Iszo1lyntTy+Pk5ZytrCiCsA/vaE+C
 /TEoPk4DqHXg4FA/zf5eFvbIHekfQZHjoJ5Cw0EBHiz65GyYwwLOSoREO7eBr7hnTKrD
 JyBv2xOzZvgpdrW5sZdmtFpdzTDVMjXUb4wTRQbEu4bFfBx3fUtYZ57BfVKZhX09R5LA
 opr/pc3kd0ljWS1YZW/Ej74DxdobqUZcyHehM1Y7Bayp4u4TGUoWsMdt3lIiLp6cXeau
 oKUg==
X-Gm-Message-State: AC+VfDxBemK4QyvyKBWBa9WvH7PDojDNLp0B3Km85QGsCq+N4RpvL6nC
 ZI6TFisr1yR0Zu2S5LN9WuB8qg==
X-Google-Smtp-Source: ACHHUZ5XF35YQhoW6eEwBUCD3iUcY3MK6CCYI1Ds5j3oUuOB+tovOKsrFDij/jYx+59W+nHLeUm8eQ==
X-Received: by 2002:a17:907:2d0a:b0:974:1ef7:1e33 with SMTP id
 gs10-20020a1709072d0a00b009741ef71e33mr8451695ejc.8.1685613833464; 
 Thu, 01 Jun 2023 03:03:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a170906179800b00968db60e070sm10262249eje.67.2023.06.01.03.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 03:03:52 -0700 (PDT)
Message-ID: <025e29ae-842f-e086-81f1-20380152dc0e@linaro.org>
Date: Thu, 1 Jun 2023 12:03:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v1-0-29efe2689553@linaro.org>
 <20230601-topic-sm8550-upstream-dp-v1-1-29efe2689553@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v1-1-29efe2689553@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] dt-bindings: display: msm:
 dp-controller: document SM8550 compatible
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/06/2023 11:52, Neil Armstrong wrote:
> The SM8550 & SM8350 SoC shares the same DP TX IP version, use the
> SM8350 compatible as fallback for SM8550.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

