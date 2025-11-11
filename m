Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF1EC4DF5B
	for <lists+freedreno@lfdr.de>; Tue, 11 Nov 2025 14:00:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003E110E5A3;
	Tue, 11 Nov 2025 13:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="Sg/1b80c";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com
 [209.85.160.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1F910E4D6
 for <freedreno@lists.freedesktop.org>; Tue, 11 Nov 2025 01:17:44 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id
 586e51a60fabf-3d47192e99bso257782fac.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 17:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1762823863; x=1763428663;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjPKo3ybe4fdml1XQE+jQ3G55BcDMlVXlR9cl8yZWH4=;
 b=Sg/1b80cSg9HS8KmTenbbosx+1MITYNBqdE1kcZptDynIcUkI30L00lyONfLq3I+8R
 IR7Mky7pDomXAcSwgtXVAb4TlIpJRYH+szUIWw15lmbvzQ4GzanO5sqX5QfedGnG4T48
 1vR1olFyVcZ3NHHqRxhIL9Lie3XhVVmS7a43lWvF0B8oNl/rIY15uVG6QgxtHhIXhlDf
 WmWbfky/Rl7x70x3Xp27x5lZaO4g+n30ueFVRv2GXlhjiDGGKC8RFmGVbPuTWB2H/b+n
 4g4F/FVjQl+YyH2vKK82TGvnGQOLgMNYaeAbrwxKWjJ3yaqj8Jz4YULw8DEY9GbjnoRk
 azrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762823863; x=1763428663;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IjPKo3ybe4fdml1XQE+jQ3G55BcDMlVXlR9cl8yZWH4=;
 b=mOzJKzOGZeZe19LDcmiGr8DrDe69Neydda7bKF0WAu0EhjsIwKBy8BI3yD003OW6a9
 3D2Uc9BWNjv+2rFDnFOuCU+4pwMoH1NZXTMYwpmeEYyAhI+lTr8QTq3YlVxCKK0GqDbu
 dtyVVNSiLDH42A0sgRBakPYr5e53tTFQWOkHL60nd0lFezOh6zmsvLupJnia3Nz/XNjy
 XiOGNY7H83FaVMZb30wwI4PWbEBVuYLPViCmEWWk3A/0fNe38PpKubKwEqX2Q70oALfD
 T5OKAunkaEyG8/g6h2KtpFh6SLydj4PdXgz8cIvZN/MohN3D2Uh1TJqPWBDdujHRndTb
 uuyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3bcxarGOqk7Mc2o9cFQgCBT0QUixiy2umnfJb+bE+udybmyocxa/4w1qxfcPFo+x3yyzx/MbyDag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJJ5/e+CaODaJiOes7m3nd5v9zENZ880U0M9MrnwcuY1SRfHmf
 jCIHn4Wh+Dig6OySmENqAWa5ymYd8+IDC1U/1F5m0i3Ia3JNOuQjiRh4JNxgcRW0Zyw=
X-Gm-Gg: ASbGncviaYnU+dvzSsqOKU6/87CefdEXTiQGpePmAhS92Fqrzi3vIIpPGYMYBkmhzbB
 hgiETp8GmBLIoE/gzOEA0eyngEcmNZqhY/are4YflWgQi5acUF7WEi7sb7yMWOXrz0961sYALcj
 XsPCKD1hdvIcJwj/IGodWWpKQus1DmZh09eTb8w3NABDRRsN2k+NcD9sRVe4GiiJkoOCSUMJ1U9
 9EftTMJNnB0BxRXO2EXmaCvlTVjJ3aWJ6aqFvtTglubKL3FbexQcOS83JA0Q2v8I/CwgsrJhNFn
 RsFfRf5ab5Ty0jYGwElCy75YIUD9kclbHad6ym6Y5YxwilofDdxJD5+SszlPhItAXCxyC8MpI2a
 RK4gSgiTPB3VYDraBrOZfnLFiGQ+GVFDznrQH84nKpgp1mhRK/ZISru6Uqm48fVUPNuf6DLqOHk
 Yp3Kr20iPJAhvySg==
X-Google-Smtp-Source: AGHT+IHYqlJ/DqUior2uObKb688W9mKskJnwhdBfDC1sLOPoqWKjn2HRpxRv5pN7HFxTPVj3Axvofg==
X-Received: by 2002:a05:6870:46a8:b0:3e1:d34:4283 with SMTP id
 586e51a60fabf-3e815aaa2a3mr850172fac.19.1762823862970; 
 Mon, 10 Nov 2025 17:17:42 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b4e9:19a3:cdaf:7174])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3e7d6f7a27dsm4076840fac.0.2025.11.10.17.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 17:17:41 -0800 (PST)
Date: Mon, 10 Nov 2025 19:17:35 -0600
From: Corey Minyard <corey@minyard.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Christian K??nig <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstr??m <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 12/23] ipmi: Switch to use %ptSp
Message-ID: <aRKOr2hyoqTnh85-@mail.minyard.net>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Tue, 11 Nov 2025 13:00:03 +0000
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
Reply-To: corey@minyard.net
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Nov 10, 2025 at 07:40:31PM +0100, Andy Shevchenko wrote:
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Quite a bit neater, yes.

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  drivers/char/ipmi/ipmi_si_intf.c | 3 +--
>  drivers/char/ipmi/ipmi_ssif.c    | 6 ++----
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 70e55f5ff85e..5459ffdde8dc 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -275,8 +275,7 @@ void debug_timestamp(struct smi_info *smi_info, char *msg)
>  	struct timespec64 t;
>  
>  	ktime_get_ts64(&t);
> -	dev_dbg(smi_info->io.dev, "**%s: %lld.%9.9ld\n",
> -		msg, t.tv_sec, t.tv_nsec);
> +	dev_dbg(smi_info->io.dev, "**%s: %ptSp\n", msg, &t);
>  }
>  #else
>  #define debug_timestamp(smi_info, x)
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 1b63f7d2fcda..ef1582a029f4 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1083,10 +1083,8 @@ static int sender(void *send_info, struct ipmi_smi_msg *msg)
>  		struct timespec64 t;
>  
>  		ktime_get_real_ts64(&t);
> -		dev_dbg(&ssif_info->client->dev,
> -			"**Enqueue %02x %02x: %lld.%6.6ld\n",
> -			msg->data[0], msg->data[1],
> -			(long long)t.tv_sec, (long)t.tv_nsec / NSEC_PER_USEC);
> +		dev_dbg(&ssif_info->client->dev, "**Enqueue %02x %02x: %ptSp\n",
> +			msg->data[0], msg->data[1], &t);
>  	}
>  	return IPMI_CC_NO_ERROR;
>  }
> -- 
> 2.50.1
> 
