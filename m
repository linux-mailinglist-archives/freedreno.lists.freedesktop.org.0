Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5004588776
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 08:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C1210FFDD;
	Wed,  3 Aug 2022 06:37:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AEC10FC77
 for <freedreno@lists.freedesktop.org>; Wed,  3 Aug 2022 06:37:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m22so13213492lfl.9
 for <freedreno@lists.freedesktop.org>; Tue, 02 Aug 2022 23:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3C/lNt77+qlJDztrS8WVjy6lbQy6qfEyINiYOOYnU18=;
 b=OkTTeDdgE1wq3JFHiRmbjgpyqJF9kC+95jnwwzwrKilHNWflwBySJidfMTBFuX1US3
 JLlom3TZgEzsdoeqoGjWDbLUUs/wzgFAasq1I/3bubb/U3cA+rKmxQqyjFFm6Goml4Kd
 yL4A1YBkBsHnJ5jm/nuf9kXHpK+/Wh/bXGqfyfPkqHdEjzw69+Co4UoPHz1VMgo2gXTQ
 n0GGainzh8Hw+TW+JVZ9ockkmlKNfPaTYHI2oNT/mHU4J9H03QGZhyxvdaY0z6pejV3B
 UVlfzuHuwgOOoVEZDOtR0K6eVjW6IEUuWpk30GlQNTScVwvI6zi1tmQlxysqusRscnZk
 PhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3C/lNt77+qlJDztrS8WVjy6lbQy6qfEyINiYOOYnU18=;
 b=0OnjQ2L31BhF67Nt6TMIM11OgMo84Q0yy5g8qruLk1rBALFh3rRyKDM7PCXu+zdbR2
 242FckVEmpuzdpvoWSCrrrmec3agCAQjz63kFDKiI/WPcespJoA6r6qpO1vY1NHqOkpd
 TIp6KPX6TAVF0g+qA0w2LKjTFXqZjNvAOZnSQjA5oxnsW6ooDgihD7sLtMwjQrrtLtQg
 rnrDp2KB3CBQkyQxPnSRT5lkDa1BvsaxNYBL2+fcAeB1aQIzw/UQrSJRfxjmIRCl/7hI
 t8rMCAeOf452Llx7cJAl2dxH4g1ShXTdg8FsjEB89EMETtQnjIbsAkyKE1IatdoLTCOz
 hG+g==
X-Gm-Message-State: AJIora9bym1kMaghwjzgEdxkplLWtoIo3VSrxQVAgDcL4nqpeGohcu+4
 xuWotoNUpPQOw567z79kG6nOGA==
X-Google-Smtp-Source: AGRyM1s5ZskGPA3x2RfGUG+ZddgaBOYCr+PGg5vqJBsdELbLJDGDQFIGpzGmtTAa7OvrGnkfkkU8OQ==
X-Received: by 2002:a05:6512:3f0c:b0:48a:433:6d3b with SMTP id
 y12-20020a0565123f0c00b0048a04336d3bmr8447107lfa.570.1659508649004; 
 Tue, 02 Aug 2022 23:37:29 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a19f80b000000b0048af437ce87sm1246604lff.183.2022.08.02.23.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 23:37:27 -0700 (PDT)
Message-ID: <f2453080-d71b-3c33-ba8e-d2ed15e06927@linaro.org>
Date: Wed, 3 Aug 2022 08:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730144713.1.I68b749219741db01356a42d782f74265d29a2ac3@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220730144713.1.I68b749219741db01356a42d782f74265d29a2ac3@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/5] dt-bindings: clk: qcom: Support gpu cx
 gdsc reset
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/07/2022 11:17, Akhil P Oommen wrote:
> Add necessary definitions in gpucc bindings to ensure gpu cx gdsc collapse
> through 'reset' framework for SC7280.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Assuming discussion in cover letter sorts out:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
