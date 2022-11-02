Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B33A616F3D
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 21:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B08E10E645;
	Wed,  2 Nov 2022 20:56:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E0E10E648
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 20:56:45 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id h24so97511qta.7
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 13:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LezinHxIM/g7YL8z+NENWzds4O5w/AflVPEU1lWlKZY=;
 b=w9sx/pbHGUwWv9Z5UN0K5mv+FPBhXCKp7XOFTxC5GlkYuFPFOCSrH0lJbaRoyR9ds5
 M3nbjBZEtjaRofkiSNe/W7PL5B8sWHc4kWPU9YXp6fZd97IdyYxx8FouUzj+O58QTvGR
 WPj0JndkI4Ty3o0PI7uadzji0qC28abbkqucbhcRD0ZPO1wOn//rvRp4QN7ZtKAI3rsM
 qOLNI+KX7gbB2QpFvZKbtLYVUquIRk+26bG3dhreckluMrWktPV50KH2ljtCnFC2L8ua
 QxXi4bCDiS29bnp5oboD1IgwopNzGREkyYEYppmZPMX1uWGdZCcxXxVj8jOs440KdtzM
 XbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LezinHxIM/g7YL8z+NENWzds4O5w/AflVPEU1lWlKZY=;
 b=NdCumOabKSuHmUftpLJ3U5bXTCDW3z9kU4b4DSApEMnBwJYqjVJ4OheRsCpgyGrhfB
 Ke2AOMrNCl+n9/hW4bc+FHs1E3UELTraypcyQWZ8bLhHvSdOKvlX6JJogA/Z0UYIXI/0
 Gr5jmGDZk8VL6mnGSGRB5AFa+JdzilZgZxAlfMuyvNfc521Xw9EM/oqCCmt2OyhKwwAz
 k/yDtIcFX/1yUrfHkAAInzZjBqZEzSynQowv4QhR/i0E1gBYSemvi5jV8kq1sLBOQ0B3
 xV7Dpkprhp9u4zGK1rqijIT0yzYlBmD+1wORQoU1Izsmv6CmzG/rtK4f6Vsi1vqTEV5R
 pEKw==
X-Gm-Message-State: ACrzQf2cAb9Z/+R7D/s/MSzQIF4LyVj9eHtJ6LykBcoSg/NXb+Pvab1m
 VnittkjRWFw329wM0wi13WZ8dA==
X-Google-Smtp-Source: AMsMyM7PHSjcA525xUqb2mRTdLe6Qynf1IGw15HV4W1FUp7u3d2iYKbm1jQAdW6TjKmvePalyJm/UA==
X-Received: by 2002:a05:622a:608:b0:398:959b:b758 with SMTP id
 z8-20020a05622a060800b00398959bb758mr21736567qta.553.1667422604968; 
 Wed, 02 Nov 2022 13:56:44 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93?
 ([2601:586:5000:570:28d9:4790:bc16:cc93])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006ea7f9d8644sm9362363qkp.96.2022.11.02.13.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 13:56:44 -0700 (PDT)
Message-ID: <38755e52-626d-ed01-72b5-d199af646c48@linaro.org>
Date: Wed, 2 Nov 2022 16:56:43 -0400
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
 <20221102184420.534094-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102184420.534094-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v2 03/11] dt-bindings: arm-smmu: fix
 clocks/clock-names schema
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
> Rework clocks/clock-names properties schema to property describe


s/property/properly/

with that:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

