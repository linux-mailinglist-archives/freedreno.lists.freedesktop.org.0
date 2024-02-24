Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2068627F9
	for <lists+freedreno@lfdr.de>; Sat, 24 Feb 2024 23:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D061710E008;
	Sat, 24 Feb 2024 22:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="okp5Mvp8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D6910E088
 for <freedreno@lists.freedesktop.org>; Sat, 24 Feb 2024 22:34:47 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so2087484276.0
 for <freedreno@lists.freedesktop.org>; Sat, 24 Feb 2024 14:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708814086; x=1709418886; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fSWAzifwmBABORc4RLjDBXc5wdSEcZlyZ0ioROWY0qc=;
 b=okp5Mvp8UeOfatDr2W4AVk/HCbpbB/uFE+poxWbNdUz+f/gJz3xF6TrsF9SGj27/Z3
 oPW5ptVnTXdk/cyWYGpbzV2h4TBypGoNuR1uWzASwEZb2IDUyUrgZBPeVRBWy79y7mln
 r0AtRuR8hziGeh6Tt0Yb8lydxZMJC+YuklWQ/nCRIidWqyHRGvxIsIykjjwemxTZlY8E
 OM0lqGbwM501em8zDnsCGlhAwxCfXFNVWQeb4geenMf4yILUAlUtx5Px0zIQitd5XXWi
 iX0Stp7K8iMv4dUdu1IIEzRWb7WlyMWtIRfUrQJ41pNKR7VRb4botbzwk0hOPg9Pekm9
 HK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708814086; x=1709418886;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fSWAzifwmBABORc4RLjDBXc5wdSEcZlyZ0ioROWY0qc=;
 b=XOX8jK/Tf9RHtU8zeNl4u5VHvuH4AobGhP6Foht7cMxRBI6OSZ6oedgafjemoxQsrA
 ms+Z6o9FDr20YlHABsOoTx+3OA19kQRNmUvNxqJXhEPZH2qVKNE7pm1z9bb+9yhqJyel
 /M+fQcy0uwfxo+Ov13gjVh6TBd7E4S3AXHPskgQii6uuGlCn/8hxj7vwoRyJKPtbWZq/
 aKcvDFOZy4XpssVpaxGvpqQFCGuPRZI9CI6wvG/eFfoKnY96vg1WiK76TQVplzEDWA7E
 f9Fn3F7sgUJnBOAt9HiRysAK689y57wujYR0CELx0nWJ6hDs7060IhQsN4vIanLCgIzw
 epZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpKWJuV81+trdBLq5xpiinavgPXnejwokJ80KxVj3QJsjBkBUjFo5sv0kNX281xCNmR6Aa8KHmMIEtWOhP2VOn8r/Q72ymzjWA562BsTaP
X-Gm-Message-State: AOJu0YzJhs4Q8MQnzi9Whpt/EdtZ86w+BmM13QGDGLQ82Q7E/rMQproZ
 41bjoq2VKh5G2M7UGzYTCmH4fOh9hEkvhaeo7dgAH6aTSS1EYyZj21RiM45Emiuk28gqOH112VH
 Z9SiljbtKS6rAx3uznnsNCR/Vf4R6QuSzpnSXaQ==
X-Google-Smtp-Source: AGHT+IEt0J5rY6GTeFZWhG/mY3NWmwow/MGIgHtdSvjrLUVIVDeFiV4UIk5CN4JD9H1JkWvYeScpNmeVrxVqVCTFU04=
X-Received: by 2002:a05:690c:c1b:b0:608:3c43:9186 with SMTP id
 cl27-20020a05690c0c1b00b006083c439186mr3300115ywb.45.1708814086115; Sat, 24
 Feb 2024 14:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
 <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
In-Reply-To: <20240222-x1e80100-display-refactor-connector-v2-1-bd4197dfceab@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 00:34:34 +0200
Message-ID: <CAA8EJppOBHhaZpS_Z34fmFmGr4aRe0-k8w=5ScquNhCrnzRDgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: dp-controller: document
 X1E80100 compatible
To: Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 22 Feb 2024 at 17:55, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add the X1E80100 to the list of compatibles and document the is-edp
> flag. The controllers are expected to operate in DP mode by default,
> and this flag can be used to select eDP mode.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Rob, Krzysztof, Connor, gracious ping for the review. It would be
really nice to merge this patchset during the next cycle. It also
unbreaks several other patches.

> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index ae53cbfb2193..ed11852e403d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,sdm845-dp
>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
> +          - qcom,x1e80100-dp
>        - items:
>            - enum:
>                - qcom,sm8150-dp
> @@ -73,6 +74,11 @@ properties:
>        - description: phy 0 parent
>        - description: phy 1 parent
>
> +  is-edp:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Tells the controller to switch to eDP mode
> +
>    phys:
>      maxItems: 1
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
