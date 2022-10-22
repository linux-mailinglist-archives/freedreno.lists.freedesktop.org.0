Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C079608E29
	for <lists+freedreno@lfdr.de>; Sat, 22 Oct 2022 17:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA61810E0D4;
	Sat, 22 Oct 2022 15:45:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761C710E0D4
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 15:45:37 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso7137854fac.6
 for <freedreno@lists.freedesktop.org>; Sat, 22 Oct 2022 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BVu4XTuwWJr/YwyXL2uAxp+NUft8bZEEOp2Ycu+REmM=;
 b=Q2BgzvRzkSWli269QFsGDIojuLbvHjW9Ea9ghjGGwo9WYK/D5Zc/5LR6oX+WqsTm9h
 3qIFiH0EjPeHTaRzTVYOltZfC/N/gMElNtdN2chpi3/EnA4SI64k6yyz1YCV67fowdkX
 EeM9cv2WXkn4oD/ILMPrnLBDlBNi5UU0OX6QmqZtCRvjRnO4oBiWewkxqUUhEvgngpxv
 XJU7/5njXfWqo5I1VEJBrX+6Z862mRWNc2AMYPantnfpIlwM8L0FQlzvx977dDD/zPHO
 zEiVnP4fxO9Bo4d9s6onoAP7anRFDgTEYa+ZuEfLcV1YYckzHVc38nYkCh5+hb7zKkO0
 zzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVu4XTuwWJr/YwyXL2uAxp+NUft8bZEEOp2Ycu+REmM=;
 b=nN3asIQQ0OhmUT5OWMvmyhv58EgWb/aicqjOkJdE10hZRrJRg6HKYc0U1W8hKat8Q2
 sUy2y0Q6I1OZaI8TYCZSphliXa6HexxIiBsd0eX9Dc1qykhaoCYP4LbYxkqm9O2s6rX/
 4B7MiuoJ8hntnp0E63xmRRWkSmo+fSDLo9ug9e3yVbyGigXzvCgE0muxoWJaEzfm74tB
 XnuUCBvNKFUVEFuQsE1Drn+9kqm2ryZWXZ3pC+cFwcE+W+VjLqS/n3k8k4nwz1BrPtCJ
 Zqfr5owcrDaT76HcOfP5KxQCO0o4chdeKuv8THbqWJhGVm2c0OcohKPxT/oMmHmFkhOi
 KimQ==
X-Gm-Message-State: ACrzQf19vHv0WCp/7HODi1GM9G17Ni1DLMjnqdj9NWJ2N4w/wtcL9/bo
 X5VDDszzQrpizphbHZ1JfMKOjg==
X-Google-Smtp-Source: AMsMyM54Jr40A+CvqVTyLVkSLJxKugf4BweTxa+vKcieHD0b/jTZxNFDPAfxieTiJOd6kzA5D45GJg==
X-Received: by 2002:a05:6870:b4ac:b0:13b:151c:d1b5 with SMTP id
 y44-20020a056870b4ac00b0013b151cd1b5mr7328351oap.205.1666453536789; 
 Sat, 22 Oct 2022 08:45:36 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a9d2085000000b00661c0747545sm2404098ota.44.2022.10.22.08.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 08:45:36 -0700 (PDT)
Message-ID: <0fa65ec4-b735-4859-401b-da14899ed921@linaro.org>
Date: Sat, 22 Oct 2022 11:45:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark <robdclark@gmail.com>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
 <20221021165534.2334329-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021165534.2334329-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 3/9] dt-bindings: arm-smmu: Add generic
 qcom, smmu-500 bindings
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

On 21/10/2022 12:55, Dmitry Baryshkov wrote:
> Add generic bindings for the Qualcomm variant of the ARM MMU-500. It is
> expected that all future platforms will use the generic qcom,smmu-500
> compat string in addition to SoC-specific and the generic arm,mmu-500
> ones. Older bindings are now described as deprecated.
> 
> Note: I have split the sdx55 and sdx65 from the legacy bindings. They
> are not supported by the qcom SMMU implementation. I can suppose that
> they are using the generic implementation rather than the
> Qualcomm-speicific one.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

