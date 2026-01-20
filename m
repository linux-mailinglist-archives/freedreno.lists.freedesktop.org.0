Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJYkD0z4b2m+UQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 20 Jan 2026 22:49:00 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02C4C879
	for <lists+freedreno@lfdr.de>; Tue, 20 Jan 2026 22:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906610E0F5;
	Tue, 20 Jan 2026 21:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BszYZtg5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF3A10E0F5
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 21:48:56 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b870732cce2so897923466b.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 13:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768945734; x=1769550534;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uywpCcOl3gnCRmtjGmJJnBGjcZqidvXnsvfeIDvMl1E=;
 b=BszYZtg51wBarSGiKmEIueg7ngFOHZFC3HDMf0Itc61+vnHUX71tle0w1/bLoIMQpv
 CsVrOb1t30Ua8mdUZLEP9Lwxg/E+dH156W8tlkzu8u4G/mOm61P9vBQlzjKDP6O3U0q+
 YUZ+YFArDn6o4VK3nzJ4jQo+yOczLCLc4SaSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768945734; x=1769550534;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uywpCcOl3gnCRmtjGmJJnBGjcZqidvXnsvfeIDvMl1E=;
 b=Ku9P7MJ+ApJunSs433daNsltsH/p1RXuoFc37RzlfpkfBPnaBbLMQx8moJiVb9Z8pd
 CtTSX3w2jcAt9THFX6G5Sd2CBUyR1ulIHK6JwrJEnjvIv+2T8CGH6tDfSfX94YDmOXxO
 Wm+q39kZ22W/MIDwnkt77kmmBMx+wYGxHA0YvC+4gV7swp4QqBqJbsy5T8A26hrRsyzD
 xKM9OnkcCl8sir6JP491TE+q1s5XTIYXtmjH1J++Mgwjj1OTvW7hzTMQIeGbOYU9Fcan
 XP07gnJ8Zn9gW0/NBdQ22Ogp7+pJWf14ROQfoskxBIaNt4bFlAhuvFsguEw+6sLXKjcN
 MmBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo095Gu+S3IkJPkZrhnq6MN2uwxC3mdRoKpqJU1KavbsOeAljddhSwNrJFX90sz8R2nxolGCFGTTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywob1h4I5UZDG25tJe75jn+zBq+mM1guS7RCUDNQcpQzfD9w3pE
 wSSxzVyUFy4RhmHMpolCNrHemNlpNvc5OdPySE0fdCGMpINJxcmnl9aiC2mWl+0tKLb1YymLuia
 8XVVKHiV+
X-Gm-Gg: AZuq6aJlCePYldhJZn4gGHi1fJfoTiN40mBDRoMV9GHhiT90uIiH8nhxG1lXjWhc1rl
 cXZ4n0Nc4fkJvjKg03FDu2f79Rpa2sTmoFnyIMqHnsXo4lxxTLrHhTF+NFTmPsMJhbbnmU5n+hE
 VZVxkbgvYMCyi7U1sjGfzTY6RZz95qRDjdbcoW4dTbR0Ztkr7lN7IKxX1tnQIydi4RV7fd0/sA7
 CfDGz1Cj6LOsEB8CamiYbP09cUNs00EVEKfx/hclnXFo00UylOKEkCzt3bs5tYSXSTMlUOt6SuZ
 UUbCnnuMXDHuMuKFRYN8eE7qv2HNX2hmbX3qWo24TaVWj/Qnz4AWVNo41OspSuLn3xVIeP97HrP
 dpdugdiBTthw+NF4c2WeADoHLHUB8u1grbWMuz39jK3fyCpDoXA5iH9MP6/G0opiSfcnCwMDP4o
 hvXfwn1pAXnVLax+Gpf/M1TWzaJ/roxo4jHmFBar8jByjgfg4Swg==
X-Received: by 2002:a17:907:dac:b0:b87:908:9ac6 with SMTP id
 a640c23a62f3a-b87968f20e3mr1480145066b.16.1768945734051; 
 Tue, 20 Jan 2026 13:48:54 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879516900csm1599780866b.23.2026.01.20.13.48.52
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 13:48:52 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo50613935e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 13:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXYF3OA0yJCbz4c7YouSUdsh8pv1si7ULnY49OHs2LV/HpHtqBJ4FmQ6ssYrVhMgzp+eKi+8cC8xCs=@lists.freedesktop.org
X-Received: by 2002:a05:6000:400f:b0:430:f41f:bd5d with SMTP id
 ffacd0b85a97d-4356a0897f0mr18898399f8f.55.1768945732512; Tue, 20 Jan 2026
 13:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
In-Reply-To: <20251029-mailmap-fix-v1-1-8534ffa12ed3@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 20 Jan 2026 13:48:41 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPdf-X7HzCFTOKQATZpcgDXpMTXGQyTCAV=y_xr9pD1Q@mail.gmail.com>
X-Gm-Features: AZwV_QjaxP26eQTw4--8Qze5CTzgWoVmspYP5DVKJyJ5O4LuAjSnwcQLfdJ3TgI
Message-ID: <CAD=FV=VPdf-X7HzCFTOKQATZpcgDXpMTXGQyTCAV=y_xr9pD1Q@mail.gmail.com>
Subject: Re: [PATCH] mailmap: Update Jessica Zhang's email address
To: Jessica Zhang <jesszhan0024@gmail.com>
Cc: neil.armstrong@linaro.org, lumag@kernel.org, robin.clark@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:neil.armstrong@linaro.org,m:lumag@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:email,chromium.org:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 9D02C4C879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Wed, Oct 29, 2025 at 11:31=E2=80=AFPM Jessica Zhang <jesszhan0024@gmail.=
com> wrote:
>
> Update mailmap to point to my current address
>
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jessica Zhang <jesszhan0024@gmail.com>
> ---
>  .mailmap | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Pushed to drm-misc-next:

[1/1] mailmap: Update Jessica Zhang's email address
      commit: 6cdd8b58458941ab4c0ffade957db8dc773fd91c
