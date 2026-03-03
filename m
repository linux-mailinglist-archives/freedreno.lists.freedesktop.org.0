Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBJ1DAtxp2kEhgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 00:38:51 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCAA1F86D7
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 00:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07BF10E0BE;
	Tue,  3 Mar 2026 23:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="W5rdZLB1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ih7c7QVJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461E510E8F0
 for <freedreno@lists.freedesktop.org>; Tue,  3 Mar 2026 23:38:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 623H1GYZ728169
 for <freedreno@lists.freedesktop.org>; Tue, 3 Mar 2026 23:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=; b=W5
 rdZLB1os+9BHgXdvpx6KEzLqpVv1IQbZ8ACWO/kQ/gYq2GERHZZiRH/kXmQRsLY+
 MgujQvEeXbQJ+OA2Uvdpi5Kix4rnprxp1rgm/315N8tlZTkcF4Eyp0mDrlyzIfqw
 qb9W1jlK7RQ8yEt5zG+Rb8LE9A5jXUqPRrwo8A5FyYGL1CMWVXaF8gCp2Mb/bupk
 O2NkZrOhzQkrC7r/VRc0Ixp3PvmEzEMXLe4Nwl2ehSpvukotivsg4qys0R/Q4rpq
 UmsSbWyeWPTrgoEBssFF4kUh3BgfCPNk/Ur8zHCabb0h0tmEqWgX8ih+VzIdbsgJ
 aL20QY1W2ii8CgqW2OpA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fukhu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 23:38:47 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-679dda090fbso118361071eaf.2
 for <freedreno@lists.freedesktop.org>; Tue, 03 Mar 2026 15:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772581127; cv=none;
 d=google.com; s=arc-20240605;
 b=ebvl576SAs6QKONCf5i+UGBiBHlw5BKQ3i3BlIq/sYJcI0HkFGNrhEw8+ludqK8yP7
 5AyD7AuCnKil02OBG4nYFgY6IDHKOCnHEUFLA+c+24zIZcSqh96arkX6db5iFUMzNWAF
 O5iZlX6SkPMtfyb/qhe7SxOrNN6E1eJ9jTkr/TFgLw/OX3/1iOWM6y4DO4i6MVueVIMT
 ktUbNJTnuMRQndazm9RUNVeUmdveBinmRpReXBEhitmXiidX9scYUuvU6Fnj4ugcIUCN
 w3WjHWpW0qtEi68cL/btFMO6CT8qPIbcnxiMaywfIuTUZkTQTdnlg27s9GNWtOJ2ZXSK
 /JWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
 fh=UiUMTgcV8k1or5QHmtsbLL+eJ/fqGZCyFU6k4o3/0Vk=;
 b=E+9jLuJySmELFM/k0P8CJybhFj/yahYLpTxrMVL8iKlGDol4McAeeqAUN0N2/0o+mk
 vJxq6wUgi8pZ8zxrSpW83kHtIfeU/MDoTgkdfSJTudQ9Do5+m/hdNRoCPEBtqXKxoTfn
 QFKUeljx+AF/sOL4i+ygCJlZiISNH2u3c9/uEhWX9caKGjBMRX+TAxGjvorOcbjXYj5a
 hoMkGyS4LBxKzzpFgWHbSQbj6AMbHm5/rRLI3af30miDOPGGXetHo1ETT2BFpbNu0q4L
 PLr181KD1/b6ikEIz32+K2rWmbRMU5m6dkPsxHkvOfzr212MhbTNCqH5YYi1PYklNCN8
 BKVA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772581127; x=1773185927;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
 b=ih7c7QVJ1o9b/Zelo3C9abIRWl4+YxPLJz6DghtigswBa4j/4KoidIcv7LoyyQ2/V/
 YZziq1Er3LXW88ge0eOVATjq2mIFm95RrGJv+Xyh3EM8P1aHK1oGBJwbkQRBLARrtHma
 gsFo+OJ7mHsGlbJJhM5Ow8LgH9DBNZCGpMzpjn0F7gYW0K0jFxytJo6woN4qGm4O+yvm
 Dmt0imIsLFoA4OAnRrS9VmC1oh2ol+r7/2h5CPIFFryEbCtiug4PZ5vbBStHGrXthy4I
 OAqfe9AAjRw7u/d5KyRfEN3sgi2hHcKc3sWeuyeS8j/JZQi6/A4/5YWktMhM0beVPzzG
 veJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772581127; x=1773185927;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HETIh57/WN1W6G1iHYhqMK98fKdw83b/Ty3WTEl3N34=;
 b=vM1IKDUXVYayec46FiMdQGKJ3crl5U+k0DHRH1tHm7gFoXo2l0SQf90TpX00TnMgpR
 OSC3WjVmECF6qltjKt4dxwYwBgxnEizAHizBckolrE57hYs4b6aMVaBMonmLWL2lGWzD
 3nmx4eXWf0VsXI2hlxBZGArTZq/IuVKPp4QRTz6ltAnA7HHhicUGdNec2UBhI7UoGdkK
 H9dAwSnrkiAS7na4OxKpHqQCq0aGn585R9eaPOuott2OK0EpaIFdD3TzKZuyRIf4WDmG
 zTAbj2nAlxQealI5zkExbI98LA6dXrV9Ni7GSwIULcDPlmJ87956BDlwIp/yaBScJGfY
 L/jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2DWQQ/dtIT+6aD3AYMVEGN978yMxhy+eHDF4+Kw/OA9gcDrXu9QBLIumsPQUChNo7YkirHs27Y2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3r3y0o0T0q3sQb5XFxT3+mtKzSrA1afa56wOWR+lxTUzvi6qs
 jYndZM7XeWIUDKlF7BgZZ9DMxb4IKrATvEciKAqLo8echFOqUzB3iKTWYhFbjPvqw/jQFBKDoZQ
 5kBUz49n3CT2jv3Ona6rOlg9CdoHpocoh7a0JoPjVz/MzcBK2Vk8W1DXp5CvhWYC4ocdE3nHihb
 erWcfKtBtss6ObVGDzuk6tch5k2ELDie3p3V8dDOnoDNnp4A==
X-Gm-Gg: ATEYQzwUvppsjD43AkhK5vWNzKdOmyfGYZ0V9WkkvRh8571MrubclNEaHHzXIdUkJmn
 oL+SIFl+x84LUYKLK4D3bjDl32ZZzMTx39OqGsdtFKp5FMCzbUmitRBiWqyDanWoCTN3RwX4F7n
 wCh6iV/+nXFgsDWNZd5kUhIUa2p7ZLGWO/0dwD3YJ7Z0rVyejAbu3aGhxfkjsQ+xE5n3AIo7vDq
 5eLl3wXgg8OmuIfVgS9Rb6sWsg0vMexShouIQ==
X-Received: by 2002:a05:6820:480a:b0:679:e85c:10d0 with SMTP id
 006d021491bc7-67b1775532dmr136165eaf.49.1772581126748; 
 Tue, 03 Mar 2026 15:38:46 -0800 (PST)
X-Received: by 2002:a05:6820:480a:b0:679:e85c:10d0 with SMTP id
 006d021491bc7-67b1775532dmr136141eaf.49.1772581126306; Tue, 03 Mar 2026
 15:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com>
 <srjcr7fosp2zvkpw4q63tbguu3edrg6ojv5zabtjbej5lr5opq@slodmuzofzyi>
 <CACSVV014AxTbB-M-Tg4X0yn=kUFnEncdc+Oc=kKrOevuAKJmAQ@mail.gmail.com>
 <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
In-Reply-To: <7q7czu7kwkmnnx3ntuduxf36lkzod4mph7ky6334xarbipivcp@3jfhc6ahdhbr>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:38:35 -0800
X-Gm-Features: AaiRm51_hWr4aVxd4N5ut8lsjNQFrYU8njlJN0yxFr2wb8YZM9tMut-iMO_Jk-4
Message-ID: <CACSVV029s0xBDgUXp+g+JjKJQu-jv5n_nSCQHyXdtfDgyjzVFA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: enable separate_gpu_kms by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a77107 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gJtko_qlBpcEJjb-Y0AA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: Eewoo_iISV_Huqbs0iwcZFhWX3y8kZ2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NCBTYWx0ZWRfXzUZW6vfyn/ot
 TmvyqFro2PAn6krn55OdmA8YQICERmsz1ZGXrZV/68yO1lCaTZWZBsTiys+LUR06jxJqproZg3D
 tzbAWtstVWeIKZC4j27qbA94YQjg/hpY3jfn3woxAIa4QxSy6X3y8DGCiTIJKLafnzqssOvNlq7
 t0J2lRiLsmu+C5hO61O15kPuIjOUPIbqsy7+gy5yTAgqXWWfDBD+rolKAbrGm2bRGLT7rBppK77
 2oLyrAXIITirn5dFvufTDCPBh/97pBFEQXMjUxKSJeR6skvGX0X0rmi7MVt/vnyWlVLFzctmBJ3
 UxExZ3Up4S+PTeoVVzM1T7SDfqB7U1pucb/1Mz+vnEGk5pk0X00K+ZUztI/qowGx70nnZrWjpUU
 ydiAhSz1Z/PI9MSdL+qq1PfnDNdFPtB2p3+iO+85m7rdPa81vvwvyCKjK+0WUAqL2qF2YxEhyDb
 Kph83LGI2Xz/e2PYqNQ==
X-Proofpoint-GUID: Eewoo_iISV_Huqbs0iwcZFhWX3y8kZ2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030194
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 4FCAA1F86D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 2:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 03, 2026 at 10:35:46AM -0800, Rob Clark wrote:
> > On Sun, Feb 22, 2026 at 12:32=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Feb 23, 2026 at 12:40:10AM +0530, Mahadevan P wrote:
> > > > On targets with multiple display subsystems, such as SA8775P, the G=
PU
> > > > binds to the first display subsystem that probes. This implicit bin=
ding
> > > > prevents subsequent display subsystems from probing successfully,
> > > > breaking multi-display support.
> > > >
> > > > Enable separate_gpu_kms by default to decouple GPU and display subs=
ystem
> > > > probing. This allows each display subsystem to initialize independe=
ntly,
> > > > ensuring that all display subsystems are probed.
> > > >
> > > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > > ---
> > > > Depends on:
> > > >       https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-=
1-9c2dbb2638b4@oss.qualcomm.com/
> > > >       https://lore.kernel.org/all/20260217071420.2240380-1-mkuntuma=
@qti.qualcomm.com/
> > >
> > > What exactly depends on this patchset?
> > >
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_drv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/ms=
m_drv.c
> > > > index ed2a61c66ac9..65119fb3dfa2 100644
> > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > @@ -54,7 +54,7 @@ static bool modeset =3D true;
> > > >  MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=3Don (d=
efault), 0=3Ddisable)");
> > > >  module_param(modeset, bool, 0600);
> > > >
> > > > -static bool separate_gpu_kms;
> > > > +static bool separate_gpu_kms =3D true;
> > > >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for th=
e GPU (0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DR=
M devices)");
> > > >  module_param(separate_gpu_kms, bool, 0400);
> > >
> > > The patch LGTM, but I'd prefer to get confirmation from Rob.
> >
> > I prefer to be a bit more paranoid.. perhaps switch this to a tri-state=
:
> >
> >  -1: separate drm devices if there is more than one dpu or gpu,
> >      otherwise, single combined drm device [default]
> >   0: single drm device (matching up pairs of dpu and gpu if needed)
> >   1: separate drm devices
> >
> > This way we aren't changing (or breaking) things for existing users.
>
> I'd rather break things and hear about them being broken.

You are assuming you'd hear about the non-obvious breakages
immediately..  I don't think that is a good assumption.

To be clear, I'll NAK any change to the default for "normal" hw
configurations.  If you want to change the modparam to tri-state so
that "weird" hw configurations get split devices, I guess I'd be ok
with that.  At least it limits the potential fallout.

BR,
-R

> >
> > BR,
> > -R
> >
> > > BTW: have you tested it with X11? Are you still getting accelerated G=
PU?
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
