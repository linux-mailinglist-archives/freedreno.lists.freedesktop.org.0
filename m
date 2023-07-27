Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E677653CC
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 14:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B2510E340;
	Thu, 27 Jul 2023 12:27:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367DC10E340
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 12:27:13 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so1592722e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 05:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690460831; x=1691065631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DbBc/Xp5vDhN57+nyWdnfZit+Hhf7+7jO6GicfM9MZY=;
 b=SKk5HURndFjmfQs/6/dI4mSdYP1Ma7B9aBTIJFoRTdIBlRIMcmuDR5FNLHh5k+HNkk
 PjvB2BConz/Mr/IDFLR/wHDEioT9km4Gbh/B+VVp1M6kNhqChbihwJ0QsDAwOOppOJp0
 2xB3jqxayJbYjNxxFP3/ZeToVAPfXJzjWL5fLres+d1jdf7wgHjwpBNk1mCiOS4fzKy3
 72qqCwLbHmLcX+4Nn0W4CsvUd4sZ8SiGEYMN3mNSyoAYPYtrA23FYcIRd0Ogcog9Xfh0
 uKl1yK/gjLnSlj/8FD3WFQii3iC0/JDipq4d1rN5E6Auc/x7kttZbQxCfzR/DDPsS7pZ
 /6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690460831; x=1691065631;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DbBc/Xp5vDhN57+nyWdnfZit+Hhf7+7jO6GicfM9MZY=;
 b=YXjI262MoEntgwUNsS2ftodZHpQNcLr5wzFiNQRgmOqldzs7YbOPoe9GDQFEGqwum1
 Up3rxGGsWKkZ2PifDkiI066Yuuyrww6JKGVJM2Lbas0MG2VzuSRcZ3nwVQitaaNW3Pio
 rqlQFPGMTwW+Na1Hi0cMRmNyT3FKZRer+lhFRlowIEqFLosH/6NNL+dgDRXlp5qo/or6
 Tp/LvoSgamM+IoD9ybPDzrPnheCFxTNKdw8DanjdR7mAgbhrJPeMy6vd1K1YWAOuL6x3
 p4r+y/n+lGb9azPtLa28VZ3XCzJ7tbOxCU1esVFts5jaFdBeGYSQcZ5BtAJbCRnsQPLG
 ZV2g==
X-Gm-Message-State: ABy/qLaJWsuybsBDfaTRSdUoJNjLs1rjwrPzl0BUqxs/0F6luNaKSR+I
 G9XVV939YFVXpDKxwJ/skJewQA==
X-Google-Smtp-Source: APBJJlHSr8IB03GxRhMBlFdFfdlZPoqNJpO9iIuq9aU4JtzQR+GUoz8bwVuMY1X2x4tOPFXaa5Gerw==
X-Received: by 2002:a05:6512:1591:b0:4f8:58ae:8ea8 with SMTP id
 bp17-20020a056512159100b004f858ae8ea8mr1930432lfb.58.1690460831464; 
 Thu, 27 Jul 2023 05:27:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a056402165900b0051d9dbf5edfsm594934edx.55.2023.07.27.05.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 05:27:10 -0700 (PDT)
Message-ID: <e9a4e015-7e25-92be-9a7a-8e5dcf3848fa@linaro.org>
Date: Thu, 27 Jul 2023 14:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rohit Agarwal <quic_rohiagar@quicinc.com>, Rob Herring <robh@kernel.org>
References: <1690448953-23425-1-git-send-email-quic_rohiagar@quicinc.com>
 <169045659774.1058731.6391693092002547810.robh@kernel.org>
 <fa84ec4f-bdb9-dace-c56a-46174a9b47ee@quicinc.com>
 <2edb92b8-a6a8-c115-757c-daccef6be5f0@linaro.org>
 <432ab1d3-0f9e-4072-ff4d-6362886584b8@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <432ab1d3-0f9e-4072-ff4d-6362886584b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2] dt-bindings: qcom: Update RPMHPD entries
 for some SoCs
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
Cc: ulf.hansson@linaro.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_vgarodia@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 marijn.suijten@somainline.org, airlied@gmail.com, linux-clk@vger.kernel.org,
 rfoss@kernel.org, jonathan@marek.ca, stanimir.k.varbanov@gmail.com,
 agross@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, bhupesh.sharma@linaro.org, mani@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, robh+dt@kernel.org,
 mchehab@kernel.org, sean@poorly.run, neil.armstrong@linaro.org,
 mathieu.poirier@linaro.org, sboyd@kernel.org, andersson@kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, robdclark@gmail.com, quic_tdas@quicinc.com,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 vladimir.zapolskiy@linaro.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/07/2023 14:21, Rohit Agarwal wrote:
>>> https://lore.kernel.org/all/1689744162-9421-1-git-send-email-quic_rohiagar@quicinc.com/
>> Please mention the dependency in patch changelog ---, so it is obvious
>> for people applying it and also for the bot.
> Sure. Will send a cover letter for this patch mentioning the changelogs 
> and will
> keep the version as v2 since there no change at all in the patch.

There is no need for cover letter for one patch.

Best regards,
Krzysztof

