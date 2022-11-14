Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A468F62869E
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 18:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C15710E2FC;
	Mon, 14 Nov 2022 17:07:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3680910E2FC
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 17:07:51 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id c25so14060351ljr.8
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 09:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/fM40YsHG69XSps9sYkKuoIaYvYZTcDub0ndtXX1Pvw=;
 b=kjSmJdC6Mfa9wOoKRy+htVdYDPOpvub0TN6pbQE+j8u4+a+UM/QFiVHrLsrjWUNnbD
 UHDvGNmiHaesMZ50QWLs3OchlpqHvtTPMTy7DpM0P170FKAQMhlRlTec/Vi7rb3hwN3z
 zhMyNmte5yxkxqAODU9OtCXZW8QiisaWfz6HgA90DbUYs2TQ9T7dc1aOJZ1znOVIPQZ0
 LeHpQl7HWNM8ycNYI/70mYxKICSUeBDHh7RA4tsncsLBtwB8+TnxotIJpjVXxRpv1zLh
 y8sIxJTperHHwqKIeTLjLkSMDM0k3akxb5oZfUKI58WjMu6CyDdQoUaOUtbux+/bbBas
 s6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/fM40YsHG69XSps9sYkKuoIaYvYZTcDub0ndtXX1Pvw=;
 b=a9IX8Ufp2nmsCGL2mvVAuXDuWzj4XZOzasIKDs8lhBFIkK73joGo8uyDi7u/V25Cas
 +c/wM5Du7bmq4Bo7HCa4criuuIACAHDMdLhJYZGmVg3ootKwR/JR+Zq57DGOEcJ2ctM0
 XZe6pFm1ssW8WzBaDNNj1dbFEpNqTe3n9o7JO9NJjXnrP7/iL9UcQNA5sSty1tSC7Pc0
 sCx7PI9Qxn+C7B6caaYyYHdGk/qzGb59pTZd+jLja5Bn7R2+TP2DJgr6GxUN5BPjKze2
 baFNHTZiIXWO8A71BMC8bTYGx80A8uC1LP02/thIlUaSKvqwVcFjRZck6aMbAge+GRGr
 GWuQ==
X-Gm-Message-State: ANoB5pkXGpBS1IDobtmXp+CL9/FqlSPMcOtrW3HVJP+LuLQ9yQFNICaj
 Ey+4UJRdvPzvI6GITo4uuifJCw==
X-Google-Smtp-Source: AA0mqf4lEIKNad99guFwwYc4jeiWore22u9FDVNQkYDR6JMjsV1sTvL7Q9zluHk9OLGTXJjxMQr3LQ==
X-Received: by 2002:a05:651c:210a:b0:277:1295:31ca with SMTP id
 a10-20020a05651c210a00b00277129531camr4422149ljq.280.1668445669605; 
 Mon, 14 Nov 2022 09:07:49 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056512070a00b004948378080csm1886391lfs.290.2022.11.14.09.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 09:07:49 -0800 (PST)
Message-ID: <47ff366c-c860-e9ad-c5ad-485eff6f649b@linaro.org>
Date: Mon, 14 Nov 2022 20:07:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
 <20221114142326.GH30263@willie-the-truck>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221114142326.GH30263@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH v2 00/11] iommu/arm-smmu-qcom: Rework
 Qualcomm SMMU bindings and implementation
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
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/11/2022 17:23, Will Deacon wrote:
> On Wed, Nov 02, 2022 at 09:44:09PM +0300, Dmitry Baryshkov wrote:
>> The main goal of this patchset is to define a generic qcom,smmu-500
>> binding to be used by newer Qualcomm platforms instead of defining each
>> and every SoC line with no actual differences between the compats.
> 
> Thanks for doing this, I really like the cleanup and the possibility
> that we can stop adding all these pointless strings every release!
> 
> It looks like Bjorn picked up patch 1, so could you please rebase the
> rest of the series onto my SMMU bindings queue:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/bindings
> 
> and address the minor review comments you had so that I can pick this up?

Done, thank you!

https://lore.kernel.org/linux-arm-msm/20221114170635.1406534-1-dmitry.baryshkov@linaro.org

-- 
With best wishes
Dmitry

