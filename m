Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C98D85F39D
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 09:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE4A10E8CC;
	Thu, 22 Feb 2024 08:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XWEk8/nv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4337E10E8CD
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 08:56:42 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5129e5b8cecso6947644e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 00:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708592200; x=1709197000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PEgtmPpUUtS04VQTMENBao32ylE6cASSI+0OxszxwdU=;
 b=XWEk8/nvJufiwWvL2pDigY+VbdZfS0tuXZI4hg91KXLsm8HIBUY/p+ZzAyER+B2LgB
 ZQKlYe3RXeQ4GKJnBD/xp8SPVTXpvGbnQgwRZxPynaqzLaO3F6Sl+iO++BNxpTI70kG1
 12Lj6kVSyMJbirww7dLQExZKavhjHWi60JL/NW+0aYLwRdFaevgulq3M0A2EGulFvJID
 +rtShsiLrKaX+Vc23AVlQkz48CPtSkjQIk1jk3tLbAtrCxKQMUMYcatKj63eNErZmHl3
 J5Ci/YRiVhJY1CjoGmqvtrqXw8ntHo+v8yDNRMeoZCKmiRsqkC77yzy/w2V9Twidbzuu
 mSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708592200; x=1709197000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PEgtmPpUUtS04VQTMENBao32ylE6cASSI+0OxszxwdU=;
 b=spjwlqQ2E2IPmMECK/REjfgb1f5geEKoClfr0Tf/VOlnCqY0RxhYk5fKQIAECgiWRY
 e5yh0zAZ5bBV9Vbx2YExYtt6QV/Dj05QCA/q7ikLs+oWr9awcoubRpM+s/qMh7yVjmAu
 jO5tRV9aFwxOk9RZ9Hz6gnunVPt1e9nn9hmz3dymo5ECFvC1Ur3JgTD2bfJx9lm+03LG
 lWHYzYERbRBY4Owyt6P7fJnwFQzTH5lRu4atTuAoK0N0SZsPit0ay1DcMpH2U/Y3zKbt
 2lI+7NSgCxvOl/QMHbiMBRD396eBUdBCIrcESnEtSKFC1gslUunmPXdder/UOqEY86wl
 aP6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUixAEwitJnf89imYrXQcEO/MoOFaK+7aacMM6ATxStq08REYmK93T8V5wUYH57S/SyeF0/hPgs4wpU2Gt8XS7Cfxp+r2/zI9+BS3xylsuN
X-Gm-Message-State: AOJu0YzFyWVzRstkpyp2ac+GKGNX7L+9vLJlQBCnv4Dve09vtp7gGz6g
 DuQ8/OuqVY/7s9/POkHGZo172C8qhdcsqGDBoWVIac3WjcFC8UstWQjtnh5ahZA=
X-Google-Smtp-Source: AGHT+IFSeuajGNAOcaAVLfuqKfripMfReJl5BdXtuhgJqsFGc8yFLiHiRUy0+Q+DPvx38P5N3hxEdQ==
X-Received: by 2002:a05:6512:1024:b0:511:87b7:6d88 with SMTP id
 r4-20020a056512102400b0051187b76d88mr13436790lfr.32.1708592200373; 
 Thu, 22 Feb 2024 00:56:40 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl.
 [87.246.222.6]) by smtp.gmail.com with ESMTPSA id
 b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 00:56:39 -0800 (PST)
Message-ID: <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
Date: Thu, 22 Feb 2024 09:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 2/22/24 00:41, Dmitry Baryshkov wrote:
> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>
>> The max frequency listed in the DPU opp-table is 506MHz, this is not
>> sufficient to drive a 4k@60 display, resulting in constant underrun.
>>
>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
>> fix this.
> 
> I think we might want to keep this disabled for ChromeOS devices. Doug?

ChromeOS devices don't get a special SoC

Konrad
