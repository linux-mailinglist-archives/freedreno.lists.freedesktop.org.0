Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C376380C
	for <lists+freedreno@lfdr.de>; Wed, 26 Jul 2023 15:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7778710E47F;
	Wed, 26 Jul 2023 13:51:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA8210E45C
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 13:51:15 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so1066168566b.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jul 2023 06:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690379474; x=1690984274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tIhYLeZ/AvTN8kR+5vNpauR4Wf3o9xkm+OqIGcJs9/I=;
 b=vBnTaVEJ2jwTWY7J+NesQ0lewu44wXXo7E/hvzdL7AFMERp40ftcDfIpgyZDx2XPdB
 JWGyp5nlZO5z+0Me0ALWzaggRmlfb6kws89iDstu6gkV9jJ4jk+4iALFlk00iUbiYFCm
 dgNrboT2Rkh0dRMi9Lmz/rwJN6Jq6c9I/R/HLB/2eudP/baY9qMa5oSU5jVuCnm2ZOxM
 2y8bEmMyFuGSRahIBkrmDUoQmlM4x/rK2+xYnq6TqeNMjv1beBC6xUuH90FvZaTvJvF5
 7zJbq7QZryG/pIFNoBEADCAsjk1bIsAkJBUqwGWvUvN7hHtUh2QEoRGVQZoiRcuG3m0Q
 Kzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690379474; x=1690984274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tIhYLeZ/AvTN8kR+5vNpauR4Wf3o9xkm+OqIGcJs9/I=;
 b=dbFK0VVHeZPYdYjx/7hy5+Od7a6wG5YQlFBxjLIKCVykch3E2SnNURZf4CrrnrCoKZ
 1+oFlpr5UxywA06iPvdts4DZXuj7ENxqqpNWff47ZO5SYuIP7oOmLPjTCoWOnY7EhiQh
 qBUZrIWiiwcrjsF4pIOuJMv96LN73HNlsYsdKOqloH4X+io3od1+2zAhDLIs2f7w19nn
 JNm5YXo3aoQgJF8eHsfFFUqLhQMOw5zV5+5NbZ+cHRxPhyzJdNCOFKkNDycy/azIWMUg
 1gIiCHPuUn9K+J7v2k/fipuJ94ehreghntGZ4NOFS0CpCFGimc8As0XFfr3hC29JcooZ
 Ci4A==
X-Gm-Message-State: ABy/qLbjpqCIcPLJ78YifOF6Fpk2J0kpCRkEC1anGt9ltkoxTVUPZukD
 9a9mMpCUhB7wERNV7Rihz84oqw==
X-Google-Smtp-Source: APBJJlE3XUp6LxM7F9jLtrJnhL99uqsHOekOGy/0IAfecfZkux5XWlJHMhpCk9hXQ7OV0HvlGJCuhA==
X-Received: by 2002:a17:907:75d0:b0:997:e9a3:9c59 with SMTP id
 jl16-20020a17090775d000b00997e9a39c59mr1781711ejc.6.1690379474146; 
 Wed, 26 Jul 2023 06:51:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a170906364900b0098669cc16b2sm9584108ejb.83.2023.07.26.06.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 06:51:13 -0700 (PDT)
Message-ID: <1f535f2f-1c93-c939-8ddf-b4d119e26688@linaro.org>
Date: Wed, 26 Jul 2023 15:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Amit Pundir <amit.pundir@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230726132719.2117369-1-amit.pundir@linaro.org>
 <20230726132719.2117369-2-amit.pundir@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726132719.2117369-2-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 2/2] arm64: dts: qcom: sdm845-db845c:
 Mark cont splash memory region as reserved
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
Cc: dt <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/07/2023 15:27, Amit Pundir wrote:
> Adding a reserved memory region for the framebuffer memory
> (the splash memory region set up by the bootloader).
> 
> It fixes a kernel panic (arm-smmu: Unhandled context fault
> at this particular memory region) reported on DB845c running
> v5.10.y.
> 
> Cc: stable@vger.kernel.org # v5.10+
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

