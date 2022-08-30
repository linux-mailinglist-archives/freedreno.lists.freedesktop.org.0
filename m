Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F26A5A601C
	for <lists+freedreno@lfdr.de>; Tue, 30 Aug 2022 12:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB158905A;
	Tue, 30 Aug 2022 10:03:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472D888C3D
 for <freedreno@lists.freedesktop.org>; Tue, 30 Aug 2022 10:03:03 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id x10so10785157ljq.4
 for <freedreno@lists.freedesktop.org>; Tue, 30 Aug 2022 03:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+Rmf6Ay/5f9NnZwdZRewRAWeUIFEVxm3g3aQu9VQRg4=;
 b=P0J8K0R7ZZqi6Jsr1dj02/aY0fuWShyfs2bZj+MZZ8gPn5iVvSjI/79ZsYMxzinfwz
 MNndVVaIsJPtL70GXStzlwNXHj6K0gb74SLgWUT7RRwbmIPbnxAWsQ8gHlbJQ2JB2KSL
 6BpZpoKnYD6w6pOeM2AadeKBziK+hYOF9M7aeNgKTFhLBn0CtVBwYvvSocucy81J3X5B
 CZgKUSS31ZUTr6353s+0CeKI1VoZ3OpZAhZd0f4X+vnloGG816uQ0HD+L+oD2uT28Bdn
 6L3FPQ+pDIepyo5QdJdXtYa7l6z+Ko9L3l01QBe4RxhHNNuzBdszogrMrL59ug3B+NVC
 rgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+Rmf6Ay/5f9NnZwdZRewRAWeUIFEVxm3g3aQu9VQRg4=;
 b=oJjVGANnw6RGzHatKHVlRWurPSNB/5WbFhTvrUOxdIj7TYfBUyHp6djoqjBdpJs+C0
 Lf8d3GBGBqRwBujPSdLuX6auz8on+eKlMc0ja/qg0C6lD2USQZf0SiYUa8CwSQpLjKjj
 By3Ldn8AT0OHWL7UCSZ5T3VqYOqSu7k4VjjxVEHMnffZ3pC7x4iCd2CHI5c1xcrHVG47
 b0FAEascNgbxSP18TkK/2KQRXxrn7Pf9HiAzxcaAR3vTsnMYhlJbUM4qXBa6Eavh90HL
 pv0xudMXC/MQ9SsxBxW/5fMEbZ0C4o2i3fQQu86+UxQcNmDG2aL0KKtwooON8uyHZZMw
 8W5w==
X-Gm-Message-State: ACgBeo2bZk4z+x1PS2zsnOzXdYDOVN2ba82b6cemoDhCzHEMwUoSksax
 xnJlDz4+WUm56vbjBeUjxiE+/g==
X-Google-Smtp-Source: AA6agR7gmsLtXHKiV5/+nl4hdZyDBOEekrdwrl2N0/Dt19xwRjqcrEz1LF6+TNZhAHJwBOXqhHa8Hg==
X-Received: by 2002:a2e:b282:0:b0:25e:46b6:ff33 with SMTP id
 2-20020a2eb282000000b0025e46b6ff33mr6645589ljx.503.1661853781591; 
 Tue, 30 Aug 2022 03:03:01 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 p9-20020a2eba09000000b0025df5f38da8sm1707002lja.119.2022.08.30.03.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 03:03:01 -0700 (PDT)
Message-ID: <6f5183b9-7979-b71d-6051-23752cd9580e@linaro.org>
Date: Tue, 30 Aug 2022 13:02:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220829005035.v5.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829005035.v5.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 5/6] dt-bindings: drm/msm/gpu: Add
 optional resets
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/08/2022 22:21, Akhil P Oommen wrote:
> Add an optional reference to GPUCC reset which can be used to ensure cx
> gdsc collapse during gpu recovery.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v5:
> - Nit: Remove a duplicate blank line (Krzysztof)

FWIW:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
