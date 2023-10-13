Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C7E7C7E45
	for <lists+freedreno@lfdr.de>; Fri, 13 Oct 2023 08:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5E010E5BD;
	Fri, 13 Oct 2023 06:57:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193C810E5BD
 for <freedreno@lists.freedesktop.org>; Fri, 13 Oct 2023 06:57:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so19062635e9.0
 for <freedreno@lists.freedesktop.org>; Thu, 12 Oct 2023 23:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697180271; x=1697785071; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YBy9l+XEWClCcH4OOaUAznM7V+kIpNxTL3AkOu2ZlF8=;
 b=z6yYDI8nIwRXAlCmNzNfHvSyUB2/MlDJ3oR4fDdVPEX3MrjvsGSa1/D/p834YCakio
 8LrxmwpwHXOpPoVg06zhpBhNmTsQPzOWF7HcS+JK08lI3xpL2BHUH0f+bV2hHLOKIUlY
 dcc+5PHOy7vezbI587LE19RZ8mLIyZb0Q53q6EXvd2vEwn7QBrXQiQ1EPzsYpYTjmr3r
 xsS5LmkskCcdul+VLm2eHmB5DoGwbJlgELeeOIkmlaLlukpCE0Gz5Rlqrh43t/tJ9j0b
 wo9JKb7Rv4WNkmHlvssqE/b+kFqZArheAptQh4fNig9HRqYizKUt/kIc5tx7cvNEO0CK
 Lp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697180271; x=1697785071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBy9l+XEWClCcH4OOaUAznM7V+kIpNxTL3AkOu2ZlF8=;
 b=K6ZmE8Pk6blF+hH4tyjA3lHHVEtzU6ovS8cloqV4h3jMOJ1nH74h5EnX74wd3oayrk
 7rDCJMTce7sMNeQckPuJH7ut5O7MN7RU1DUlqRddhJuH4UML0lXUz/YSFIFv5qI9+tvp
 oCKdEyKoNR2okHxhd2VkW4hk8cp/D6P2i8fwAEgiYMjrD0KPzlmcvRJ6bj3/cRogKEXz
 pepFSqjsTLesNIp6BFgTtvON0JMVMNhnNEhbEgEnn594ubv10q3HrR2j6XAObnA9slu2
 xxSsIXYVetqG8VYhrjQe5EmotCB93KQgAu5vMZR4TjRKpc8U9nlFz3z7BMOywZLTIsk9
 wm5g==
X-Gm-Message-State: AOJu0YyGJqIkrC969M5svVeVlJ0e++Chk4XgpRr5fl7NHXV9o0Ls8Eew
 r+m4kDbOZHMcvkcGEQeVD5bxUaPGauoiq/Bpcpk=
X-Google-Smtp-Source: AGHT+IEyoDJdhh++O13oXxShHbpJTi9KhjM4IDj834nwqW3H9PJvRR4kepkTe0JszzOG0xCv8HXfng==
X-Received: by 2002:a5d:4fd2:0:b0:31f:f829:49aa with SMTP id
 h18-20020a5d4fd2000000b0031ff82949aamr20364123wrw.23.1697180271533; 
 Thu, 12 Oct 2023 23:57:51 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o17-20020a5d6851000000b0031779a6b451sm20025673wrw.83.2023.10.12.23.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 23:57:50 -0700 (PDT)
Date: Fri, 13 Oct 2023 09:57:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <f19a598c-7e22-4399-bb14-a2e757ec498c@kadam.mountain>
References: <de03d47f-27e5-412f-aac0-42d95f6a5501@moroto.mountain>
 <5170f4f9-d414-4b53-976d-5df2cb8b8314@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5170f4f9-d414-4b53-976d-5df2cb8b8314@linaro.org>
Subject: Re: [Freedreno] [bug report] drm/msm/a6xx: Send ACD state to QMP at
 GMU resume
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 06:33:20PM +0200, Konrad Dybcio wrote:
> @@ -1810,8 +1816,8 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct
> device_node *node)
> 
>  	return 0;
> 
> -	if (!IS_ERR_OR_NULL(gmu->qmp))
> -		qmp_put(gmu->qmp);
> +remove_device_link:
> +	device_link_del(link);
> 

This patch looks good to me but there is something happening here which
I don't understand.  This is not related to you patch, but where does
the device_link_del() happen in the remove() function?

regards,
dan carpenter

