Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A55636B216
	for <lists+freedreno@lfdr.de>; Mon, 26 Apr 2021 13:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6413A6E820;
	Mon, 26 Apr 2021 11:11:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301A96E81C
 for <freedreno@lists.freedesktop.org>; Mon, 26 Apr 2021 11:11:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a4so55448587wrr.2
 for <freedreno@lists.freedesktop.org>; Mon, 26 Apr 2021 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uXYb6BcHq27B6ScYW5tJ2SsqBaNuDx8oA92+GxjafKM=;
 b=xvUi/jFjSPOSvlz/BbBKn+ZE/Z9NzwrofgB+eXRzJYQ/2bL+Zb/2VVGEt/iCzyPK98
 pL/9abpx2tk1hTgBG+JZESktFflsU17VR7wROE4/rrO1Cn4RyLqRP1YUNglHucbWC8S6
 FOapPgutJJ9vKG0pgRhXNA4OuWK2cYA8x6XrJoQw07n1tJk9I5G+861+X0/z3Trj8pJQ
 kkaZljXTsrsuiVJKyTtS7854orFz2eynPNELr27p9eMBR751mXIJXN/tFyxP64DI+96A
 lCIcVSZgqJU9/c/usNiOESCKyIqI0DPDeryvlUzWHzdJyWfA9xJBsAnXo+zYDj1Y+++L
 tx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uXYb6BcHq27B6ScYW5tJ2SsqBaNuDx8oA92+GxjafKM=;
 b=bzN/r+bHHciTzN34bAnHMGECHluxYGDshA9rpWeozbWClGwr7JuNeVQ8UNUXIbH85t
 /1jVtdoGt6rZ2F0yTMfL0Bpn5bN8pwpVYUxic09LWuWNRmhbt1Q9xnu0TbTHzgAFTKPJ
 qWF7WjOnzN3Cd1yRKSKfPVWiSdumBaQzcEeeiDZaxxhKfN3Z1qCAuwgnjrrt0vmL1HBV
 lQBoxbqDWZ5d7W5HVbruDiDs6u95PtS/cDryiet5bzl3N3O9A8a8Ro0028tlFHAMHdHh
 hELpiANaUQgjLATu83BFH65IK8+nACw3CHD1Zo/RnC/2ZZSl7YwjzUcpif1c8olFYQdk
 VcUQ==
X-Gm-Message-State: AOAM532M7usEgkHzFHgDbOTaueV6YG2CWN/5ioV5w+CYbmxqfywRrkNo
 GZMO8vrazG1Z6FOaZLaeZxP5jA==
X-Google-Smtp-Source: ABdhPJzthkQ8A9dbPXyiOrcJp3qKrnW8BYa16c26OInVfMwwDZA1oulOtgOaJrtr56/7q3TzEzs6yw==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr22233136wrd.367.1619435478756; 
 Mon, 26 Apr 2021 04:11:18 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id t20sm19529761wmi.35.2021.04.26.04.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 04:11:18 -0700 (PDT)
Date: Mon, 26 Apr 2021 12:11:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Message-ID: <20210426111116.4lc3ekxjugjr3oho@maple.lan>
References: <1619214904-10218-1-git-send-email-rajeevny@codeaurora.org>
 <1619214904-10218-3-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619214904-10218-3-git-send-email-rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v2 2/2] backlight: Add DisplayPort aux backlight
 driver
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>, mkrishn@codeaurora.org,
 Lyude Paul <lyude@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Apr 24, 2021 at 03:25:04AM +0530, Rajeev Nandan wrote:
> Add backlight driver for the panels supporting backlight control
> using DPCD registers on the DisplayPort aux channel.
> 
> Changes in v2:
> - New (most of the code reused from drm_dp_aux_backlight.c of v1)

Did you respond to Jani's feedback on the v1 posting (asking you to
coordinate with Lyude's work on refactoring the i915 eDP helpers[1])?
I can't find anything showing the outcome of that.

[1]: https://www.spinics.net/lists/dri-devel/msg295602.html


> +static struct drm_dp_aux *i2c_to_aux(struct i2c_adapter *i2c)
> +{
> +	return container_of(i2c, struct drm_dp_aux, ddc);
> +}

[...]

> +	np = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
> +	if (!np) {
> +		dev_err(&pdev->dev, "failed to get aux ddc I2C bus\n");
> +		return -ENODEV;
> +	}
> +
> +	ddc = of_find_i2c_adapter_by_node(np);
> +	of_node_put(np);
> +	if (!ddc)
> +		return -EPROBE_DEFER;
> +
> +	aux_bl->aux = i2c_to_aux(ddc);
> +	dev_dbg(&pdev->dev, "using dp aux %s\n", aux_bl->aux->name);

It looks like this code "just knows" that the I2C controller it has
looked up is a special one. That seems a little odd to me.

If we "just know" this then I'd hope that is could either be modelled
in the devicetree or that it would be possible for the backlight driver
to be registered (possibly using helpers) by whatever it is that is
setting up struct drm_dp_aux in the first place.


Daniel.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
