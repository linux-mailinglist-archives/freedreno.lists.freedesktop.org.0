Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FEBC6EBC6
	for <lists+freedreno@lfdr.de>; Wed, 19 Nov 2025 14:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD4410E24A;
	Wed, 19 Nov 2025 13:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="LaPCcjZi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D4C10E24A
 for <freedreno@lists.freedesktop.org>; Wed, 19 Nov 2025 13:11:19 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b73669bdcd2so938434766b.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Nov 2025 05:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1763557878; x=1764162678; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2hIjgqXWXn3Sbfto+9OWapsp1QwhUBtS+kZIjBq+Tlw=;
 b=LaPCcjZi7EVwyffkNGTptbk31UK2L0vpseElImv0p33uRVtxFANzoySZPLut/lSTnh
 0RwZhx5JuQZ2F9J9GhQz885vlDp2b1MrO66zr0nMiOHxnpNJHWNcDodxEyvLAWom6LW0
 zKDlJ4WyYHm3vDCqipnQrYKPZlUpafMPumOkVd5nCtgRire8Kc3/ELpTUl4jl0GjMcX6
 Y1Goyj7/sr8it5NxXI/4PDrkvUucomknvpoHDoy9jLXP+Jk6lzdjPCuTBKgNr4iZHm6y
 a33VbQz/XgmSqnMpVfABkVlIWkEe2xNXwJrfn4hEbT35BVAunmj6eEoBpsdkULIUeVmX
 1Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763557878; x=1764162678;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hIjgqXWXn3Sbfto+9OWapsp1QwhUBtS+kZIjBq+Tlw=;
 b=q8FN2oZleRatEid1tHcaBc4x9KXfQLNUrtXmu6waKExhDO9c5QUR2D6sKAnzUG4diS
 +TY+tTzWVo9OgUIIzpy1Zl76bAwA7+BkxQJzr1NKxZplAkoaFZzO3zC3TL+Bvqw2fp6Y
 3laiodc7BhBOMi+I/FSaO6a6cep2ABvvqvZqJuCArMA8I8yqsQwilWsm7u5jsZLzq4Ga
 JkT+fp/5k6OUpsuxHwVuh5lo2QT8KDXgFhQwjteCc4ZBzCvUfbEGn1bvf4SwGIyewWvW
 FUy+ejFe+91wQ8K78/RA4FKZXjSwTrT1+G+0n9NX3Hv0FK+/Mk5yW6CkYK/cVq6om0aa
 Qp+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhlwvTpGjmzG/UW6QR1FDA24p0lO+2OdS+Y+TY+79B10E3TlKLXyiRE3SSB2cUhRxzdEQ3tLWTqC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRYCSCqrhwJihDVM7bP/vxWpy6cDe2aAH6wx77tJzUtVvIjpdq
 BIxHqkQSaRdpsCzvVUy3lE8dvHQxvQw7YBqlUX6vZycR/nXbLYQF7KQYhidSZR9GG0Y=
X-Gm-Gg: ASbGncunsscm2wTvBlHALIewZZ2TXieFUpbHig3OyF7hmPTCk5nIH5h4lDlbYOrgmMu
 wFKq4pl0ITKP1Hd3uhSmDhFiiYuMq4IVLemLhXKUQOqiYEENu/7Q8QZBOLyxw0+l/tMyjh9OQiQ
 dsbrg5Mw1SkThce9susD+jUYbz0PNpqibD2mVQlbUZmlQm07vA1AzgBgSmQOc/ok+/MaaVo0c9F
 jYyLDezsOC7cwKVY4LX8o/Hkpl6KT1+8mTaXKhcVvPumgs2dgavRgv+XwEQXxdLtpXVL/WuR5+k
 7eWtbDoClVI8pOZYi2yM1fRmxXyGhrg6qIF62+WVbo24CYIouZprM/Y9+o+7ukwX6hgmyjhJf77
 9o3pwTjrRSuvvk2D0ffandaEUb4+P+TACttmDjDVAQoisON96i0QuUzGeEYBuBRmibaAO9iYa9M
 AUlqO+2hszjbLR/g==
X-Google-Smtp-Source: AGHT+IHh/9HSY9QxYY7JWRlsHkQE77dEey/TQadLHho4kIFH9l0Cnuj5X98H1aD+vZkw9c2t87Tcgg==
X-Received: by 2002:a17:907:96a7:b0:b6d:50f7:a805 with SMTP id
 a640c23a62f3a-b7367c02586mr2099815666b.59.1763557878059; 
 Wed, 19 Nov 2025 05:11:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d8775sm15093392a12.5.2025.11.19.05.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 05:11:17 -0800 (PST)
Date: Wed, 19 Nov 2025 14:11:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 00/21] treewide: Introduce %ptS for struct timespec64
 and convert users
Message-ID: <aR3B8ECx9W6F0BV_@pathway.suse.cz>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
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

On Thu 2025-11-13 15:32:14, Andy Shevchenko wrote:
> Here is the third part of the unification time printing in the kernel.
> This time for struct timespec64. The first patch brings a support
> into printf() implementation (test cases and documentation update
> included) followed by the treewide conversion of the current users.
> 
> Petr, we got like more than a half being Acked, I think if you are okay
> with this, the patches that have been tagged can be applied.
> 
> Note, not everything was compile-tested. Kunit test has been passed, though.

JFYI, the patchset has been committed into printk/linux.git,
branch for-6.19-vsprintf-timespec64.

Note, that I have:

   + fixed the 19th patch as proposed, see
     https://lore.kernel.org/all/aR2XAYWTEgMZu_Mx@pathway.suse.cz/

   + reviewed all patches but I triple checked 7th patch which
     did not have any ack yet. And I added my Reviewed-by tag
     there. ;-)

   + I tried build with allyesconfig. It succeeded. I am not 100%
     sure that it built all modified sources but...

Best Regards,
Petr
