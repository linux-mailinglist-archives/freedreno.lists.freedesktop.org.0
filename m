Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18C16686B
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2020 21:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CD56EE14;
	Thu, 20 Feb 2020 20:35:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCED06EE14
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2020 20:35:11 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id q81so28987180oig.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2020 12:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dj2rW5WH1XuuP/JPuEpJptUF9hTbGtr1qjFfIR5yvb8=;
 b=WEDEVvtUfZbuuWbUIl8B4h4NT35B/Y1wYy/sMFj3LEbSIwD739i6QmlPdTeNvj/O3g
 lPArY+SqlNtmoO1PLh+2K6LH2APXNnPEnYsQ9yWknHro2x42/uMNQiAoV2fgkScqFzTD
 qGlcC0cr/ADCcjwxrxGp5TWfZtHXSHFD802eQ86/+2Y4HI1brwdCV4BhLb4lOQ8m5riN
 S7HVIP/qfaJwDJ8E8E98i+R1aOYK7iUnzt4vGXUYaK4/J9nJi/Vv990dqRGcOnvY878/
 lWbXoqQzATPJBdZNWMeuhU98Ag4NPRgWfh8jdmDcf2KojLWev5lr0sNnKaB8k69BfhDF
 WPRw==
X-Gm-Message-State: APjAAAVIn8idqjjym1dE/0VqkicVCrdXYhzvq/bvdtpzrDiPZ4IHwS+/
 wdJ4ViMAOF2EK0ui9KbZkw==
X-Google-Smtp-Source: APXvYqxwJ/2yGaYe0f1ffh3BnhSHPhuRw7WYXDEqylBf6OGb/cfcQC8kdGy9BeTH3mgWz4ApoOvUbg==
X-Received: by 2002:a05:6808:249:: with SMTP id m9mr3532186oie.5.1582230910787; 
 Thu, 20 Feb 2020 12:35:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e5sm182426otk.74.2020.02.20.12.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:35:10 -0800 (PST)
Received: (nullmailer pid 15161 invoked by uid 1000);
 Thu, 20 Feb 2020 20:35:09 -0000
Date: Thu, 20 Feb 2020 14:35:09 -0600
From: Rob Herring <robh@kernel.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200220203509.GA14697@bogus>
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Freedreno] [PATCH] dt-bindings: arm-smmu: update the list of
 clocks
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, mka@chromium.org, dri-devel@freedesktop.org,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 20 Feb 2020 13:42:22 +0530, Sharat Masetty wrote:
> This patch adds a clock definition needed for powering on the GPU TBUs
> and the GPU TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clock-names: ['bus', 'iface'] is too short
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iommu/arm,smmu.example.dt.yaml: iommu@d00000: clocks: [[4294967295, 123], [4294967295, 124]] is too short

See https://patchwork.ozlabs.org/patch/1241297
Please check and re-submit.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
