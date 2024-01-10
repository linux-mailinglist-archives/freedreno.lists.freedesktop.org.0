Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C97898298F5
	for <lists+freedreno@lfdr.de>; Wed, 10 Jan 2024 12:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B10E10E044;
	Wed, 10 Jan 2024 11:26:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FF310E044
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jan 2024 11:26:04 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50eaabc36bcso4909981e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jan 2024 03:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704885962; x=1705490762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ukZ4eHBZ+lqRJdXFeiOENdmgYKBt7ZSKa90/KfaTIsk=;
 b=V0B9mGZtfCtX209ig3C/6wgiPyLbocz5Hpo+mGdTOZgAp6w5Gwr/dDhdxrUEC7IiaX
 /GwBiIigYUy15QxoNnal6SgRWkTxeg8fPhlVJw2zEpfEWnnlf5RuQK7hPRc+qQpflDPg
 QT98qmWJrE4tbKJhvfI3r6BiroJ35/6IU6NlhBXxo3GKSL2XKbdZY6F3/SsnSYs5iamU
 b5/Mqe8zxkjcaleP3P+o5vO26TkXzpE8I1JRvf/kgC/qt6aZBYvZIBgf42SDANi1ctrb
 WDj4G8TXliPydupzD7ZB4HfohqOEP3CFs0eiO6cPiUpFTK85WZFX3oSuk9uBmPuRWe7s
 UuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704885962; x=1705490762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ukZ4eHBZ+lqRJdXFeiOENdmgYKBt7ZSKa90/KfaTIsk=;
 b=FeR18vrkbEwZEdjuRMY/mw0LhzjPMJ+3iQ49/5TUO2yQdkzuZuzC/FZn8oFnePLdNe
 oGRbjClo1//SUbLe0gP9RT4eneqQDI4SGIcTxckfZnpPpFZBAVxE5LgU4U3t/+QOQov7
 CG6/RPBGPBPQn7GX0IX/J6wepty6061sNHzjKP/2V6oQDIdQ4JNobzUWi+eVv7OSQVjW
 3rOwREV8jIJYGtdTqAo3XXLZxFnZjpd2JagZoOue49plNPgdpM1V62+JX8P/+CLXJ4rR
 QRdWTgcoQl3MGDaFEWLqDlwW1nDgGJKyCma1yJghfkp3Qdezs1NfKUlDav3pqzlrKciS
 Hamw==
X-Gm-Message-State: AOJu0YzkV1TPHOxp20ZasEj+0PXlEHk2cN1z346f8xGmlQpBGq7WUU7h
 5y7zoFX4xl0FnsftLtwqJ5bvD3Mw/DtcGg==
X-Google-Smtp-Source: AGHT+IHdYZzUKlwAGo0xKf7zZS+FfVCqQy+Pwm2peTl8E/6DsvQMtNRqyGPsNtC9/9+lQE3r+hjjLw==
X-Received: by 2002:a05:6512:376a:b0:50e:8d0c:5eeb with SMTP id
 z10-20020a056512376a00b0050e8d0c5eebmr319316lft.85.1704885962325; 
 Wed, 10 Jan 2024 03:26:02 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056512046800b0050eb7941041sm632908lfd.297.2024.01.10.03.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:26:02 -0800 (PST)
Message-ID: <c4693d39-4ec1-4759-9dfe-74d9556dbc99@linaro.org>
Date: Wed, 10 Jan 2024 12:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] drm/msm/dp: move next_bridge handling to
 dp_display
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-14-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-14-fc3e902a6f5b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12/31/23 01:44, Dmitry Baryshkov wrote:
> Remove two levels of indirection and fetch next bridge directly in
> dp_display_probe_tail().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
