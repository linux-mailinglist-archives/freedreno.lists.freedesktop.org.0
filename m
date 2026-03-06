Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG68F0Y5rGnAnAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:14 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E922C354
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 15:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D610D10E284;
	Sat,  7 Mar 2026 14:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bhz+ER+6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D7E10E162
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 19:57:04 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-59e5aa4ca41so3167058e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 11:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772827022; x=1773431822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FemvMqGcUV/au1GngB7WNKuS2H1VDSQhU9vxX5PjUlg=;
 b=Bhz+ER+6L0ibu44o8CFlR6rGdV2cskuXzKvWVzDkuj5qKY5uGjspYOtH7FsdBTUl47
 DV9BYxrfBVdWBlki7fHyxM+d2HLoyEKvIdSB4z3oT5hQ4Po7qOXeUyFdyqt+PDUAb0IQ
 Tp9tOPXY41BSsy0jz/myHfaI91offBEDDCR0Pnflc+KVkkFY2POLWTKn1ba1GE5zSKOE
 minHoyUP0PKkEkQFiPWcdFrZRzoYIDoqIjby8/eIMxnrGhdLc9kqUJADhAaCmpFl+AgB
 gPI51oGE+WECpCWl4xFfW82QBZ9252dTLyA74YqN/ehO7QCL7/KpuerOeQ2zIvKpP9HI
 5DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772827022; x=1773431822;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FemvMqGcUV/au1GngB7WNKuS2H1VDSQhU9vxX5PjUlg=;
 b=MupUwGzFHcEMNG9pKxH9Oxarwp2+2bx+coeG2jt6QmqfQhfVg+NINH6qbp7I1LcEQq
 MCzgJpdwbKJv40VLUxKGrTo20mKPhrhDe8OJazwfI1M2vjUGDoNulTAsYLe/PTdZdKoy
 75/bGfBtBV8QqdV5ZY1SOddfxix4NkDJn4I+4wDY1qRH4W9kunbfntWA0CvrFhJDuQoc
 BSryrI5BV4wDKwVS9TFk1q0+mJtQQK0xaFCOvJ5S+8Gc6vvGioaLNq06oIZ50anaBRPy
 CvwZLZiUVJVPOXPJJua1+akw+zb+iDoGLjMlieMCQOBTOk4rVhuyeLheroxGGcBRgZ8W
 U5ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqBDmxKifF3t57ch7Y6hqBlIrm9/UQOgBjLgl4EZqbmO37FKZ4f6bQoIqZJfW6e3Dqu2e1lIONEPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBxj/1yfdTLXEX6OE//iGtjE+t3EOzHJd48wOQG78Wyf+gQPX9
 Uie6oSYAZ7CDR8sWrux4c+A3KmQhQFsd4vnG4F/P0XoUnab2NL+iJTc0
X-Gm-Gg: ATEYQzymylHnpPWVECyoySR02prJfT5B74HIP1xSCeS5oSm+YOMKNwHp8Z7Nl7GTVIT
 lyXuK5qdIqgsjTBz3baor9duKKtIfcJP0noLsIMblp3dvO7nYk8Qetk1phYi0BQtv9jAJDM2k8m
 L2Tj1txkI5uMNZZDqezq/D1eHKSKhV6N4lRjrur3xQ7BntIGmufVC9cdKcLWXNdTjOBAIKvE5h5
 E6tQypCUadmXdY08B2jdlvWCsilHL1kbFXmD+JstqmUNZ1Bl6BZjr8J0iqlmJJq7oTdmfv5qpIs
 TN3s7eAB/jUhtzuXorFHHe2ajr3uZBALG0DJUIMvUtzad1iGJ7QPCU8nFVIaOjZIlFrWu3FFPMd
 2MQSPjkvF780D3wwFhd40BSdWUleNRfDRiI/OiFCjjYzYUepli7lQa23RLZ4j0AmvCYpyyQImcn
 A5Ni0UDy7slNhqA8PUcHROpfO9Z/j/C9o8JZNkxu+Hef4nXP87/KTVB9qk1c0fBdOwSPl6W69/S
 4U=
X-Received: by 2002:a05:6512:3f10:b0:59e:24e5:a3a5 with SMTP id
 2adb3069b0e04-5a13cceb81cmr1156649e87.29.1772827021859; 
 Fri, 06 Mar 2026 11:57:01 -0800 (PST)
Received: from ehlo.thunderbird.net (broadband-109-173-27-236.ip.moscow.rt.ru.
 [109.173.27.236]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d08d4a0sm509448e87.87.2026.03.06.11.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 11:57:01 -0800 (PST)
Date: Fri, 06 Mar 2026 22:56:58 +0300
From: Eugene Lepshy <fekz115@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pengyu Luo <mitltlatltl@gmail.com>, Danila Tikhonov <danila@jiaxyga.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
User-Agent: K-9 Mail for Android
In-Reply-To: <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
References: <20260306092518.37849-1-mitltlatltl@gmail.com>
 <groq7xzuqen2bhumrjt7u4v6mnpbnoxzpvn4cue2fayb2mim67@u2ya7glxxgv3>
Message-ID: <C89A2E4C-6818-4BC8-9144-E76103C0A944@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----45DPAANOKC3D6DT9J8ORQLHOZYYW59
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 07 Mar 2026 14:42:10 +0000
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
X-Rspamd-Queue-Id: E90E922C354
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:danila@jiaxyga.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fekz115@gmail.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,jiaxyga.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[fekz115@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.881];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

------45DPAANOKC3D6DT9J8ORQLHOZYYW59
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have a concern regarding this patch=2E The Nothing Phone (1) (sm7325-not=
hing-spacewar), which is already supported in mainline, utilizes a panel wi=
th bpc=3D10 and bpp=3D8 (DSC) [1]=2E

Currently, this configuration works properly=2E While I have encountered m=
inor graphical artifacts during brightness changes, the display output is o=
therwise reliable across all supported refresh rates (60/90/120 Hz)=2E

Since this panel is already upstreamed, this patch might cause regressions=
=2E

[1] https://github=2Ecom/NothingOSS/android_kernel_devicetree_nothing_sm73=
25/blob/6f027f0440e3dce8a674d9cbd2f6ad944120e209/msm-extra/display-devicetr=
ee/display/dsi-panel-rm692e5-visionox-fhd-plus-120hz-cmd=2Edtsi#L483-L484

Best regards,
Eugene Lepshy

On March 6, 2026 9:47:23 PM GMT+03:00, Dmitry Baryshkov <dmitry=2Ebaryshko=
v@oss=2Equalcomm=2Ecom> wrote:
>On Fri, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:
>> In upstream the msm, for bpc greater than 8 are not supported yet,
>> although the hardware block supports this=2E Remove them until we
>> support them=2E
>>=20
>> Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits p=
er component")
>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail=2Ecom>
>
>I hope Marijn, Danila or Eugeny can comment=2E The patch series with this
>patchset added 10 bpc panel and used it for one of the phones=2E
>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host=2Ec | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host=2Ec b/drivers/gpu/drm/msm=
/dsi/dsi_host=2Ec
>> index e8e83ee61e=2E=2Eb60b26ddb0 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host=2Ec
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host=2Ec
>> @@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_ds=
i_host *msm_host, struct drm_dsc
>> =20
>>  	switch (dsc->bits_per_component) {
>>  	case 8:
>> -	case 10:
>> -	case 12:
>>  		/*
>> -		 * Only 8, 10, and 12 bpc are supported for DSC 1=2E1 block=2E
>> -		 * If additional bpc values need to be supported, update
>> -		 * this quard with the appropriate DSC version verification=2E
>> +		 * In the upstream msm, only 8 bpc is supported for DSC 1=2E1/1=2E2
>> +		 * block=2E
>>  		 */
>>  		break;
>>  	default:
>> --=20
>> 2=2E53=2E0
>>=20
>
>--=20
>With best wishes
>Dmitry

------45DPAANOKC3D6DT9J8ORQLHOZYYW59
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Hi,<br><br>I have a concern rega=
rding this patch=2E The Nothing Phone (1) (sm7325-nothing-spacewar), which =
is already supported in mainline, utilizes a panel with bpc=3D10 and bpp=3D=
8 (DSC) [1]=2E<br><br>Currently, this configuration works properly=2E While=
 I have encountered minor graphical artifacts during brightness changes, th=
e display output is otherwise reliable across all supported refresh rates (=
60/90/120 Hz)=2E<br><br>Since this panel is already upstreamed, this patch =
might cause regressions=2E<br><br>[1] <a href=3D"https://github=2Ecom/Nothi=
ngOSS/android_kernel_devicetree_nothing_sm7325/blob/6f027f0440e3dce8a674d9c=
bd2f6ad944120e209/msm-extra/display-devicetree/display/dsi-panel-rm692e5-vi=
sionox-fhd-plus-120hz-cmd=2Edtsi#L483-L484">https://github=2Ecom/NothingOSS=
/android_kernel_devicetree_nothing_sm7325/blob/6f027f0440e3dce8a674d9cbd2f6=
ad944120e209/msm-extra/display-devicetree/display/dsi-panel-rm692e5-visiono=
x-fhd-plus-120hz-cmd=2Edtsi#L483-L484</a><br><br>Best regards,<br>Eugene Le=
pshy</div><br><br><div class=3D"gmail_quote"><div dir=3D"auto">On March 6, =
2026 9:47:23 PM GMT+03:00, Dmitry Baryshkov &lt;dmitry=2Ebaryshkov@oss=2Equ=
alcomm=2Ecom&gt; wrote:</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); paddin=
g-left: 1ex;">
<pre class=3D"com-fsck-k9__plain-text-message-pre"><div dir=3D"auto">On Fr=
i, Mar 06, 2026 at 05:25:00PM +0800, Pengyu Luo wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin-bottom: 1ex; --com-fsck-k9__blockquo=
te-default-border-color: #729fcf;"><div dir=3D"auto">In upstream the msm, f=
or bpc greater than 8 are not supported yet,<br>although the hardware block=
 supports this=2E Remove them until we<br>support them=2E<br><br>Fixes: b0e=
71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits per component")=
<br>Signed-off-by: Pengyu Luo &lt;mitltlatltl@gmail=2Ecom&gt;<br></div></bl=
ockquote><div dir=3D"auto"><br>I hope Marijn, Danila or Eugeny can comment=
=2E The patch series with this<br>patchset added 10 bpc panel and used it f=
or one of the phones=2E<br><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin-bottom: 1ex; --com-fsck-k9__blockquote-default-border-color: #7=
29fcf;"><div dir=3D"auto"><hr> drivers/gpu/drm/msm/dsi/dsi_host=2Ec | 7 ++-=
----<br> 1 file changed, 2 insertions(+), 5 deletions(-)<br><br>diff --git =
a/drivers/gpu/drm/msm/dsi/dsi_host=2Ec b/drivers/gpu/drm/msm/dsi/dsi_host=
=2Ec<br>index e8e83ee61e=2E=2Eb60b26ddb0 100644<br>--- a/drivers/gpu/drm/ms=
m/dsi/dsi_host=2Ec<br>+++ b/drivers/gpu/drm/msm/dsi/dsi_host=2Ec<br>@@ -182=
4,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm=
_host, struct drm_dsc<br> <br> 	switch (dsc-&gt;bits_per_component) {<br> 	=
case 8:<br>-	case 10:<br>-	case 12:<br> 		/*<br>-		 * Only 8, 10, and 12 bp=
c are supported for DSC 1=2E1 block=2E<br>-		 * If additional bpc values ne=
ed to be supported, update<br>-		 * this quard with the appropriate DSC ver=
sion verification=2E<br>+		 * In the upstream msm, only 8 bpc is supported =
for DSC 1=2E1/1=2E2<br>+		 * block=2E<br> 		 */<br> 		break;<br> 	default:<=
br><div class=3D"k9mail-signature">-- <br>2=2E53=2E0<br><br></div></div></b=
lockquote><div dir=3D"auto"><br></div></pre></blockquote></div></body></htm=
l>
------45DPAANOKC3D6DT9J8ORQLHOZYYW59--
