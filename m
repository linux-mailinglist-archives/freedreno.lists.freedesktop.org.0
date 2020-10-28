Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987629CF7A
	for <lists+freedreno@lfdr.de>; Wed, 28 Oct 2020 11:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4AA6E4E6;
	Wed, 28 Oct 2020 10:29:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376F36E4E6
 for <freedreno@lists.freedesktop.org>; Wed, 28 Oct 2020 10:29:46 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id b12so2262761plr.4
 for <freedreno@lists.freedesktop.org>; Wed, 28 Oct 2020 03:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1pIhF3Lx72mYJfiMtwf9QoYKy68h8haDkbJMtDNYKEw=;
 b=A5zt5zl/3a+3Lf6ycRXqaL23CVTsmGCVta8hYuuRyWm85jhP7yy4UtsmSZy7osgGO8
 0Htg7p+tSzx943zm1oqpQtVMxsYpCQLWsZR+s3FSJhV1niNcbt8n/UlIJzuYS9jEwutH
 4HJR14Hc9K5YbNBcIm9/PEMAdrMM5Jbw2mq6S0/rIQRPDGoZ//V8RgwDNTuPMxhc7haO
 bfd92SIOiVSQ1+uNr+jLeTMg8hkUo3f36tTcyiGag/PIA1uoT0CXOZcUHjy4HSuRZhEG
 gpNL89nH/JtWad1FLF6I17dXaAvqYJfXtIU22lU5Rld5yfJri5H0Xe134gj9JwAzpov2
 PZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1pIhF3Lx72mYJfiMtwf9QoYKy68h8haDkbJMtDNYKEw=;
 b=fHlzDLYxmCm35Wd+9tDIck9mZR6IqaDuuJnPUUnd239ExFRgeC+lj0o/jbmL19UuXx
 XhZfB1FiXzs/S5s4+ojoJrWdqaSj9AcK7KyvURdbYIMmPPY+TJqr9QkrAVPkvo+/sGny
 /wtHuggt3Cy17H052JARIpOFk7fJllkOYJDqiDo9KHG/P++Uu6gJynY0Is/NHlgdwxta
 ETdwDa/PexYgOYYOyXUMg1+TVvm78v9NF57cBvWU90+1+Np0dHTC/XA+/9dkjfpYrIfd
 pMVdRRTIgB4vdw/ru6m8hxgGFx8KGgb8uqqw0s5c29KxCh3CV8+O+jMvmUF2PNHLt+Xu
 71Wg==
X-Gm-Message-State: AOAM531swk+P41OWY8bvX/yugviZmUQlwkjGIkw30uoRQso8x53gb2zU
 b4AMcvvlpmPocL+LX4KKe8ivVQ==
X-Google-Smtp-Source: ABdhPJw/lN1Rdn4IAlyuzBmnXHAuWRhy9Jalsrt5qmfXLWggNb6REZMG2RfZFvV2Oa+QU+95iAenSQ==
X-Received: by 2002:a17:902:8a8b:b029:d5:f871:92bd with SMTP id
 p11-20020a1709028a8bb02900d5f87192bdmr6827921plo.10.1603880985833; 
 Wed, 28 Oct 2020 03:29:45 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id p5sm4520672pjz.47.2020.10.28.03.29.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2020 03:29:44 -0700 (PDT)
Date: Wed, 28 Oct 2020 15:59:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <frank@allwinnertech.com>
Message-ID: <20201028102942.zc5hgqpo2bfrn6in@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-3-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012135517.19468-3-frank@allwinnertech.com>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH 2/3] opp: Add devres wrapper for
 dev_pm_opp_set_prop_name
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
Cc: nm@ti.com, freedreno@lists.freedesktop.org, eric@anholt.net,
 airlied@linux.ie, vireshk@kernel.org, tiny.windzz@gmail.com,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
 dri-devel@lists.freedesktop.org, gustavoars@kernel.org, sboyd@kernel.org,
 robdclark@gmail.com, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 kholk11@gmail.com, sean@poorly.run, linux-kernel@vger.kernel.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12-10-20, 21:55, Frank Lee wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Add devres wrapper for dev_pm_opp_set_prop_name() to simplify driver
> code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---
>  drivers/opp/core.c     | 39 +++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h |  6 ++++++
>  2 files changed, 45 insertions(+)

On a second thought I am looking at dropping this one as you haven't
added any users yet and I am afraid it will stay unused.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
