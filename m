Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A298C7D6C3A
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 14:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF8B10E649;
	Wed, 25 Oct 2023 12:45:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC5810E649
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 12:45:35 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so83145101fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698237934; x=1698842734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8hwbHxNJHKIYfg2V9fOMg3eCs72qgcfQnjq8FaDx1jw=;
 b=J0oRpLl+GOTPeXyq6F7U46oQSMVJB0amIpUkxWc4aRQIIrkipBhDXP0mqDSQpVegrY
 EF0lCWCR97WfIiw90FCqjvbte5DaTziIELstSEIRhWxYLPnb2sq8sbCIwnv86FSwQprj
 74RKXu3vCBUShcw8fAbl0tNqJDQXZhILRjpgf1CYdeqDg2CXrCNK6Bp5ryg01fyj9cd4
 u/Iw62Y+CuX1zLqan507PYSpl0kG7PYiABe1psO/KXP/GqrMQAPgLESxLi6qPvVZ1KLS
 7uEraQL08QzJhk4XGy8+2SpFtJhNx7Kqmm06F/110cic4NWWYe67mSiDISLp3MA0xRmC
 v01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698237934; x=1698842734;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8hwbHxNJHKIYfg2V9fOMg3eCs72qgcfQnjq8FaDx1jw=;
 b=H+DY/tzg0F+bqFFWPP/8zZlo77ad5Q2z8ALCAH4ifbnIs37TiuoPlXCGnR4M/5k0Lc
 X7115aO3hukEXgI3MpURn/zrikbvFksk2rQa8SGa7cCtDJTKEnUNGwSJj/VZ7K8PBVrP
 rV87XdGQA/7BmhVQMzgyl0dUhzbczjZVsgCfLV7fd+E10Gxqa6kyHPWlAZ10qqhVnyNs
 e55GrIi7VT729nlMs926WumGCECxYBdisKgAeUM9HFWrFEtgGjrPHWywmaoF4qK3F07n
 jmb9HJjAHHlEAnYidsEtI5WfRceast9M/NGBnZhFV8N7Y2R+7wVEW7P+K8RfjZR2V43V
 U8HQ==
X-Gm-Message-State: AOJu0YxUBNhndNUDufOfHLVb/UWRng6IYDrviihygV/xPEbCfMlANHvD
 bhsmEJrJ4dvFjnD1JCc2kGBOpw==
X-Google-Smtp-Source: AGHT+IGm4J06QL06svQANFyfaj+/EUWPdef+xMSV/kjvuIObpEBzlgVccGrT3eMK/MQ05YabvI6mnA==
X-Received: by 2002:a2e:9c44:0:b0:2c5:12c4:5ff with SMTP id
 t4-20020a2e9c44000000b002c512c405ffmr10140098ljj.17.1698237934113; 
 Wed, 25 Oct 2023 05:45:34 -0700 (PDT)
Received: from [192.168.53.189] ([188.162.65.61])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e8e6d000000b002c4faf47378sm2419884ljk.28.2023.10.25.05.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 05:45:33 -0700 (PDT)
Message-ID: <65f841ba-5b70-4cbe-98e0-3d53e5b7944c@linaro.org>
Date: Wed, 25 Oct 2023 15:45:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Simon Ser <contact@emersion.fr>, Johan Hovold <johan@kernel.org>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
 <ZTkIpMWpxKzSE7gQ@hovoldconsulting.com>
 <NDl6Ye92jJDp3fm20AwcuUKWuP8tzQ9CyWGGRltZ_DxYgxep2DO8Wil0Nmsfmhp1j4vAp9Yu1duiHeQkjBG-bcAdFoW3ZbWxvVqrCEpQe_4=@emersion.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <NDl6Ye92jJDp3fm20AwcuUKWuP8tzQ9CyWGGRltZ_DxYgxep2DO8Wil0Nmsfmhp1j4vAp9Yu1duiHeQkjBG-bcAdFoW3ZbWxvVqrCEpQe_4=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] soc: qcom: pmic_glink: fix connector type
 to be DisplayPort
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/10/2023 15:29, Simon Ser wrote:
> On Wednesday, October 25th, 2023 at 14:22, Johan Hovold <johan@kernel.org> wrote:
> 
>> I was just going to post a patch fixing this after finally investigating
>> why the DisplayPort outputs on the X13s were annoyingly identified as
>> "Unknown20-1" and "Unknown20-2" instead of the expected "DP-1" and
>> "DP-2".
> 
> Note, ideally userspace should use drmModeGetConnectorTypeName() from
> libdrm to figure out the proper name for a connector type. That way we
> only need to update a single spot when adding a new connector type,
> instead of patching a whole bunch of programs.

X11 does its own thing. It further "renames" DP MST connectors. So on my 
laptop I end up with DP-1-1 in xrandr, but DP-3 in kernel.

-- 
With best wishes
Dmitry

