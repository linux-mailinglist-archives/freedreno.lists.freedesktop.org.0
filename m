Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7715F28305B
	for <lists+freedreno@lfdr.de>; Mon,  5 Oct 2020 08:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA57C6E094;
	Mon,  5 Oct 2020 06:26:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2C36E094
 for <freedreno@lists.freedesktop.org>; Mon,  5 Oct 2020 06:26:36 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id nl2so2103066pjb.1
 for <freedreno@lists.freedesktop.org>; Sun, 04 Oct 2020 23:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SKaQ5+8uUmRtIWBKZSxd+2jDGXEKN5QdEKsAPMYJkgg=;
 b=hVUBIPjnHGOWjGUi1oUG2maCLkvuCE7pMNCmJn6gkaIVPZ8LdYKidM635ZHKQeHwr+
 l2knVD95lg4NSfyju+W6598JCldz5UwtjNiq5Jw8H8LWwbCeS4VjYFXgNY9WYCMElFUg
 2atFKK1Z5tvYk+DhYbjVwhkBzLDgUhCcKGzBzX8j4fumt3o5pOmUeq9QqIeXEm7BnOnZ
 a+C2Am6JbEg4Ha9fo3qOa+KC6LPN927a6o67oRVjFKDbmc9/uYW0fgX+Cks4uxcGs2HW
 NWZrgF1TEebG01jSrJh4i4AjHHuHT+bSBFJDRKzAlvEWgDfpYYZ6UGBMMucpf0+sffjM
 zsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SKaQ5+8uUmRtIWBKZSxd+2jDGXEKN5QdEKsAPMYJkgg=;
 b=UH9jlmxnga9BXwX+zYsGnL8npy7ViknpglGBAh4hkEsB7XZlGjSO/NjHAsFsH7BtmI
 k4EMtOADMAZUb0E74zlljHNSH2vNeaL8TJ/sgu4wIszso+JebcvUvBbViRYvA44NuT0p
 Iix0zSkN5ZeV1y6ArYdawXv72ppz+E6hkDx+vm0fPTfnUt/SAjtL4krWbsfwWwcusZET
 OZg4aVlQbeE8bvbn6NyQeyoP+FW87DR05VX9vljZXX9dYFQshfGEsuJ3ctDUq1BzgCgA
 fcstjbix2F/ONrVIZMuNVfPT8Q3zCZPdbOgyPl5ZxuOznS9JGXmcUctq0u40Ye8nxN2U
 Gnlw==
X-Gm-Message-State: AOAM530Uk6eW0xzcvFVmdNx9+EX3kg+8N8XDCPu2KcZNNheiUoZi4uwM
 xdWwre7gWIj0WZA2Mu8Af2O2aw==
X-Google-Smtp-Source: ABdhPJzMX/4YpxutBiiXM2fWXSSduuaC0HQCvEVYpnrcJsYem70ESjGjA5g+ApA82zM/o6oW1zh/YQ==
X-Received: by 2002:a17:90a:e282:: with SMTP id
 d2mr104042pjz.159.1601879196092; 
 Sun, 04 Oct 2020 23:26:36 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id j6sm10860110pfi.129.2020.10.04.23.26.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Oct 2020 23:26:35 -0700 (PDT)
Date: Mon, 5 Oct 2020 11:56:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Message-ID: <20201005062633.ejpehkpeuwksrx3e@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28-08-20, 11:37, Viresh Kumar wrote:
> dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> find the OPP table with error -ENODEV (i.e. OPP table not present for
> the device). And we can call dev_pm_opp_of_remove_table()
> unconditionally here.
> 
> While at it, also create a label to put clkname.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Can someone please apply this and the other drm patch (2/8) ?

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
