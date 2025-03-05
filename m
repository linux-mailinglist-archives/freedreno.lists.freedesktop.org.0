Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB8CA501FC
	for <lists+freedreno@lfdr.de>; Wed,  5 Mar 2025 15:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8223310E7BA;
	Wed,  5 Mar 2025 14:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ElIxzQX/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F1610E7BD
 for <freedreno@lists.freedesktop.org>; Wed,  5 Mar 2025 14:30:34 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso1801856f8f.3
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 06:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741185033; x=1741789833; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R0yOXShCD331pfPEJ3FsGxKQVoIHXaBgZZkBDARsPvQ=;
 b=ElIxzQX/yg3uxmb56SPyXDIb2re5qt6FjTvn2/QXuu4Q5I0PpK3fQIVrQj2h4D94QI
 9TCFuOWhZN/A91IAKl1WRYlxnpoztWMQfXUQx9YSuL1ZWaY5Di7OUGR8ZMZZM9WUQySr
 gDgADdVGibYgs6QMsQm6rjJcOyBuLts4cMeOUdxm332ByxMq98UdcqXCppepoQUXYeSH
 45kDvWfBmeW65qGOFeI4RGQdtec26RuRFXXyHBUK/lzvLzl2lKKj13O5j30cTSf5YbAJ
 Hf9QD+5E526sLpfX7t2Wopw3593F1mJPkhHGu5m/P2em0YWigvjygjxzFmFR5is+jJtQ
 GH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741185033; x=1741789833;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R0yOXShCD331pfPEJ3FsGxKQVoIHXaBgZZkBDARsPvQ=;
 b=cqtId+AzZZV0wi48m7BRrqIn9LR77JHidBX8BCLggJFkWw5ODweMZYUOJ0TFA7qeMF
 yewqVfALWIOZIxtrXMxvVaKlujiWEPwVZhBx4qzBeVSjd6GwVq8dLgdT8fLDhcGAQZqP
 VyWFGKIrKR2zmzT/YnKHUavhGKkdB9VY3AfK1uGt1OzlPzwVYmN3G/5cIbqQaKGpzxqP
 LWZzvOwlwpY/Pgwbp5B42VhlIVfHt0CqOeusj64B1x5ErsUwC4U4hliLo8zyD6otixx3
 yCNIa6pzu7+h0VMCME0ryfb/SyKdrLYvzxBUhjwZ+w6XZ17UK4rQj6o+cqUQVuQEzot8
 YtmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrBIrduk1fYRDblG2uTPBB1TKkLIORfu2mg6FLRsvDmeTKsu9vBLij32Jy2WKv2NvJ0/b/7G/+c/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD37aM3DMz2v5n3S69g+B8vtz/fDbqEH8kNCTXpzhCGuyF/O4N
 ++7QBaPFiGnByimVEu6bveXIz89if5m//SGjiyEhz53NYMR/kWEG2KQuRvgkOXs=
X-Gm-Gg: ASbGnctO0J87OidUaYu9zoTRFh34IalhU1rlYDkXwzR9wiGLwZ89HDBrv++K30qZsef
 Kn5AWD1QMJ6zjTzuOIyq2e0nE3aXFpJN9J/klspqdaj6dZl/+IDZJhdZS1NAiOMdILx1PzCk+Av
 0Sck3bwSF1/chw6F6XHKdhCRkux+/Jh39U4vFWWo8qRMDY0xujU/ocDt7s/P8r0H17fTD//67RU
 nndl2mELBrE77Vhxnug6VBe/6BbBKXIzpa7J7Tz3mAqJ78Eq9UCl+MZ8s255uCClFChr6cydxZC
 OLWGsKy9BYWmWZwkYBRE1GCbvApz8Me/7t/ww2rT3MB1+jDeNg==
X-Google-Smtp-Source: AGHT+IHFtdp8P9AwIBs/SYYRDTy7hEWSk3RAiMKjuzC82tpdeKPpX7kjP/l1pi94ZuG5P/EuaCVziw==
X-Received: by 2002:a05:6000:1844:b0:390:f698:ecd0 with SMTP id
 ffacd0b85a97d-3911f726495mr2931784f8f.11.1741185032737; 
 Wed, 05 Mar 2025 06:30:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-390e485d785sm21057865f8f.83.2025.03.05.06.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 06:30:32 -0800 (PST)
Date: Wed, 5 Mar 2025 17:30:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?utf-8?B?4oCc?=
 =?utf-8?Q?undefined_behaviour=E2=80=9D=3F?=
Message-ID: <ed9e65a7-6cdf-4d93-83a8-464b47a4bc1d@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
 <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
 <20250305141732.26b91742@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305141732.26b91742@pumpkin>
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

On Wed, Mar 05, 2025 at 02:17:32PM +0000, David Laight wrote:
> On Wed, 5 Mar 2025 11:51:59 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > On Wed, Mar 05, 2025 at 09:40:43AM +0100, Markus Elfring wrote:
> > > >>> The address of a data structure member was determined before
> > > >>> a corresponding null pointer check in the implementation of
> > > >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> > > >>>
> > > >>> Thus avoid the risk for undefined behaviour by removing extra
> > > >>> initialisations for the variable “c” (also because it was already
> > > >>> reassigned with the same value behind this pointer check).  
> > > > There is no undefined behavior here.  
> > > 
> > > Is there a need to improve the wording precision?
> > > 
> > > There are words which denote a special meaning according to aspects of
> > > the programming language “C”.
> > > https://en.cppreference.com/w/c/language/behavior
> > > 
> > > Dereferences of null pointers are treated in special ways.  
> > 
> > This not a dereference.  It's just pointer math.
> 
> And the 'fun' starts because NULL isn't required to use the all-zero
> bit pattern.
> Regardless of the bit-pattern, things like (void *)(1 - 1) are valid
> NULL pointers.
> 
> Of course, while C allows this, I doubt NULL has ever been other than 0.
> (It was 0 on a system I used many years ago where the O/S invalid pointer
> was ~0.)

Kernel style guidelines don't even allow if (p == NULL) so we would be
screwed.  :P

> 
> I know Clang has started warning about arithmetic on NULL.

Huh.  You're right.

$ clang -Weverything test.c
test.c:13:22: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   13 |         printf("%p\n", NULL + 1);
      |                        ~~~~ ^
test.c:13:22: warning: arithmetic on a pointer to void is a GNU extension [-Wgnu-pointer-arith]
   13 |         printf("%p\n", NULL + 1);
      |                        ~~~~ ^
test.c:11:14: warning: unused parameter 'argc' [-Wunused-parameter]
   11 | int main(int argc, char *argv[])
      |              ^
test.c:11:26: warning: unused parameter 'argv' [-Wunused-parameter]
   11 | int main(int argc, char *argv[])
      |                          ^
test.c:13:17: warning: unsafe pointer arithmetic [-Wunsafe-buffer-usage]
   13 |         printf("%p\n", NULL + 1);
      |                        ^~~~
/usr/lib/llvm-19/lib/clang/19/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
   26 | #define NULL ((void*)0)
      |              ^~~~~~~~~~
5 warnings generated.

Well, that's stupid.

regards,
dan carpenter

