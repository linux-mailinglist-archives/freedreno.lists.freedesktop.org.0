Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470D616F31
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 21:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24D10E639;
	Wed,  2 Nov 2022 20:55:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FE610E639
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 20:55:05 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id x15so13345611qvp.1
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OXUvCOmLRFj9V68bWV7FWt2GZPLPNIKne6rJYA5H4CU=;
 b=D1CQ9NtJXqPYE+vCPKr8iASAXv0p5iWoGL9eZG4QDqTyTmWqwJVNEiW5+qYfkXIug/
 uRYLmM+HHhEKiy+JI4h9xhHI5G+pPndloIVCl5zf8Zwp8ApcFy43qMjZY+8bkYoHHrm2
 8090vMlfGQbJ1ivIbwh641L4kkj3x3MTfHHuVEdRnurml6Wz1CSAPfqheOjqDjJ2HhV9
 Vxb8pMk/NhjW/KJChu7uDe8HkHsHG1Vb94KUnX1C2WzeslOB++L0imyHYV6mvKbyi0tk
 Tlv9rCGXBpAOIJ0jQOKiRN3EYsFMBNAiNj+cPWxv7EuCC98qp0Ch/SyScpW8xRzjmojQ
 OCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXUvCOmLRFj9V68bWV7FWt2GZPLPNIKne6rJYA5H4CU=;
 b=XrzYrgOQMxJEpRJHTDqvrJKMI4/r9SeKVKyXmWWLeRmFNM3jWUmn29NL+oXg8fAdi5
 o8plNfUxOZGrSNNDwwzcXGgKOAE34LjE0Wdz+sx1SRDc+l/YGNVMJHz//cf8Sn99EcRH
 6AnEnTJazh0yXmnw1s+VZfa0aliRhEuUJLD9sTYN3wPyeouLjf2UKesJJHbZvuZ4xTGx
 qxOKjeg25fOjZxA9/q83UgksCFykbBiW3uY3WultT7HU1Eo6TTMYwaCesHLIKSY78MUL
 eALjU8lf2uwPpB/BVzGRcZCLJCnGnruiIPgR/4oPjSjyOVCg1kv5xEzL0QfiouIw5ikq
 h5lA==
X-Gm-Message-State: ACrzQf1apNILhOK/hv2EoNGavdijBcF1jONS0VoK5mS6zBfDAO6Qyqyr
 Y5MxtU2BsGOFkOU+h408MHEBmA==
X-Google-Smtp-Source: AMsMyM7+29i6Elah2pR6EE8TlOoJQ4k6UjG6XeeZiHQ3jSqRDTJWquBOM9BrGIlRXeploqkyfUUhpg==
X-Received: by 2002:a05:6214:5182:b0:4bb:a323:4ca5 with SMTP id
 kl2-20020a056214518200b004bba3234ca5mr23147068qvb.121.1667422504780; 
 Wed, 02 Nov 2022 13:55:04 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93?
 ([2601:586:5000:570:28d9:4790:bc16:cc93])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05620a430700b006eed75805a2sm9176959qko.126.2022.11.02.13.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 13:55:04 -0700 (PDT)
Message-ID: <1af9189f-2a59-7c4d-6582-ee222051ee8c@linaro.org>
Date: Wed, 2 Nov 2022 16:55:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221102184420.534094-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102184420.534094-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v2 01/11] arm64: dts: qcom: msm8996:
 change order of SMMU clocks on this platform
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/11/2022 14:44, Dmitry Baryshkov wrote:
> Change order of SMMU clocks to match the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

