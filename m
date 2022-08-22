Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B391859C4CA
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 19:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D569A841;
	Mon, 22 Aug 2022 17:14:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A7C9A706
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 17:14:39 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id by6so11221925ljb.11
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 10:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=9himZF0X8uG7VtMtKx5KhDuc0l4LTNicCLHWrXQv1hE=;
 b=iS2E3tIuz/DolNw48VEJUIphAvHcY8QIyWZ3Pmo+JxmJHr3OXQY3p1XvUYjbhfrJ4P
 K1U6plgEYaHU6pio4P1iOWGhjRff7tNpVgUmbqmMj9Nh3tFlxFpk6TA6zxV6I6YhhBBV
 6hzyKPUczerEiY11XdiyCtMm+zsugy5q9HJupUJK7VChiIVF50AwIk/SiYmRgZjkbTao
 vJ4BBLXTEZpSMHQ8IZKIoMkkeObnFQ5GBT352/xr8AA4FCs9eh+xnqq6z7oX5xwUhNrU
 m6FBiEdsgPu6yQSUrEu59Rv6Ok5ppRPsbjiKCGvnMx4gINK7HOFDXh4rJGLl2Mhf8ef0
 B88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=9himZF0X8uG7VtMtKx5KhDuc0l4LTNicCLHWrXQv1hE=;
 b=yw6nOH6Ei+p1Hx8f5YGYunrb6suqLwAGZE24keZZwRYNXqKVo8Nw3+/1EIdiBWC+k2
 mEvK+lw8+O8/AvDSYzOrp4FSqbkl8ahhF9h2/UdEy3nwEZMgVsflnfTqJoU9e0whAJNt
 UyqBhbWTkTSQdoliTe6mEy/39Utu4KlLU5NhVqgJdGKHSL+9oivdIoeEb/huz2UL2tRs
 4Eze+JNgqjml/f/PqTybUJ1K1czzosFOPlLBE9HlYVd/xdY4/Jnn3AEtEQOwGMO5y2fr
 6xOI6cul21P7TxV3W9A39MjM+GBgW2vgJvZCza2tK0+NVGGnzNxUtq311TEn1YUstY0Q
 RopA==
X-Gm-Message-State: ACgBeo02hb2w4zeXSTwVRXhwX0ENt1fGOtOQ542B6DlqUUBYW/z36gOq
 etwJEpzi04aZwnsy03GaMdig1Q==
X-Google-Smtp-Source: AA6agR4/rF449NMPTVcPCDnjORxR1Gu7l2jJVrObqE9vy5//dWkB64tOg0ApwfX70XHvU8csjitKgQ==
X-Received: by 2002:a2e:9d92:0:b0:261:c3bb:2ef5 with SMTP id
 c18-20020a2e9d92000000b00261c3bb2ef5mr3944163ljj.350.1661188477537; 
 Mon, 22 Aug 2022 10:14:37 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p16-20020ac24ed0000000b0048b1b2233ddsm994762lfr.120.2022.08.22.10.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 10:14:36 -0700 (PDT)
Message-ID: <090fde69-2d2c-c5c4-79de-c0fc6f5d0de0@linaro.org>
Date: Mon, 22 Aug 2022 20:14:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220819221017.v4.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 3/6] clk: qcom: gdsc: Add a reset op to
 poll gdsc collapse
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/08/2022 19:40, Akhil P Oommen wrote:
> Add a reset op compatible function to poll for gdsc collapse.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

