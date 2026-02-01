Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id J0juLMSHf2lutAIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 01 Feb 2026 18:05:08 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F323EC6962
	for <lists+freedreno@lfdr.de>; Sun, 01 Feb 2026 18:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E0410E0C4;
	Sun,  1 Feb 2026 17:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="knziZfSb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9fRAgTT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A75910E0C4
 for <freedreno@lists.freedesktop.org>; Sun,  1 Feb 2026 17:05:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 611CO6j4069899
 for <freedreno@lists.freedesktop.org>; Sun, 1 Feb 2026 17:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=SkQapyydoC0VxEibl3NMUCJT8sClEX4Owo4NznNEdY4=; b=kn
 ziZfSbS+DECA4+DxajVAGMjWymXOX1zM9ClStQQtcsPnvFCkUmoXeNritwf63AD1
 I61t/cCQikGJwKMdOfSizED2f8CElGPt0jrH/uxQSzI7pQnpCTq9VFyNS0veHwcI
 A4rdJ0eHk2pZlV6LkNDDp23Jgwaxl8mYwY8OAPcCwa+RCt8wd3AXGwgCdBGML7ES
 HrwaPZIVv6Oasz0h2/NzbANxi2xLkr/cihPPo5Vmc8VJtosUP1CPPAhQVynAKsYW
 +R3pcm1brUstI8v5ThNlbOb4EjF1KTkOoo8dc9BEgPxfios+24P9HcMFvDprC4bP
 sJDhqN9a5jpaoHq0njiQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrtvh1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 01 Feb 2026 17:05:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b713fa927dso2955471eec.0
 for <freedreno@lists.freedesktop.org>; Sun, 01 Feb 2026 09:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769965503; cv=none;
 d=google.com; s=arc-20240605;
 b=R3y871Hkkwh247i+9I8GdqbvgFNB0pPnKfz0LmzuvyZ1z/clO2Hl3EAFw9DQO/VPjF
 E0h+kjM1RPSBMtsGgX8G8/KyI6K4xIpY1xbNQKdPq+Jg8QvyQTFQqCtCHU857ZpojaeF
 ukBp9cs2ZVUmHzhC6nHRiBtyuHkatwL5XLO/POv2jYFtyJS1ubgiiWPZ/zGHCpAvMI26
 uY3G+aYBE2mBYbXOcDzYuKxUttB01B5pIYrgI+B3DUAhIYtuCSoNgKTVbEoJb0ddvyJR
 7GYF40DqhHE6ul2njXffBfmcwSiYoB7s2GWzN8iRUSjKeRRc5cKBdMxhKXUkqIhDWtnE
 iHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=SkQapyydoC0VxEibl3NMUCJT8sClEX4Owo4NznNEdY4=;
 fh=UXJ2uUb6pJcmUYRw0dnt9qRScpOPe6z6uxLQraUpxKc=;
 b=CHMVHjenfspKT1JW3l1yGfVLltb/0tc0cVO+sB1D/Q12DYm+vCPaLQU+N7HhJjeg56
 Pm8RXGT8P188JNpGpcZ/EfZdCY0uAT0ihs59GN4H9/AU5TknBZnoVETIiQtnRlXRfhU6
 I8tFEpZK1BkZ15dQchYT6kbaLbS7D2/t26IiIoGl1PYR1e8/K7W6rB6321sgJcvEUA+Y
 MtD7eO9HESxmPXNzU1MB5WT1GlvXfk94GrC1OxRF780V5YeYKr4xhf1GG4A9GI5v9v5J
 PFYdjVFIWINyLZ3VVxLN6JPNwERdM7JsIYyGwb9qoXOmm/pMXtEUGFxgOR7+opXVxBXo
 oU/w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769965503; x=1770570303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SkQapyydoC0VxEibl3NMUCJT8sClEX4Owo4NznNEdY4=;
 b=L9fRAgTTDziJlgjuDkIb36/vQnDBE5FsAyQkUE3D/mNrnnY4Blj/5cAGMaLbPj5MGW
 JDuRItXl5GOBefm7fDe2+/6WethW0A2W6ywDgWGB9DlNM0barRmmbmeYHCIYNqu9sdBv
 usuU+7abnUeck3AXW30dQo76Dr/MPMwh3UmourgnG++3WGO4dYILu/ca6mPAyDKKbh8v
 g51qKHpmXbldVLTZiout7N4aWqbDuAfQ22glDvbGaqPSjxS8nJ/YD0MFm0IOzIb+0i6l
 q4E5dwbNjbgr6iL8uUViDTioW4J0e5AVT7zerQORzSOidvyvnc7Id1IqStYlq2P2QfrI
 arEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769965503; x=1770570303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SkQapyydoC0VxEibl3NMUCJT8sClEX4Owo4NznNEdY4=;
 b=kLI8mshqNSK+rKzmyVTQelyJ+SXf28Rmo0CxRXZkLQfVJr+C+ziHkufwXaJt/B5oKk
 Cv/BIhKrVkY7v8A3ZVN3tx91yHwPZk46ZCrG5rTsQqBzRtRTVOW8y7VrJHb4Si0yA7wS
 yn1eilUF+kD8vySSQttuDAeNq6H09R99KET0MwWjLP9YXhRgDLXF2/Ake8/MLu2mhLnZ
 YP9cUgJvvr5hOfzQMaEVnTst1imbsoSbAtISc1bmgajzYpeR/asDbeEdtO/1C2JmDf+V
 QtHDYS0+AWZgwkGqWHfgjppWA11FsgKlGpKBtj4E0KJU+Z6kXo5G7++W/3f3/lPf5zmL
 ZBMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiHb9BMQFP0MqShwibpe8fFH91xKsyR04CDfDs+f2MR6AcHbFKNE84R4n7nMqJAfD+wysnxQ3liyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxuc58Uil4fFPffuEK3pPuBflZZ/ZUJdTpqyfltEFDqMIu13/J
 ch2pG0cVJKDnSeh85nL05Bs8hSaePIP3i0ZQZtJJWSC8eMZh+ICSdmsa4ozCiIYbgIIUb6n9lvj
 N/vib+8mlfN3c8kQa31FaIXWpBc6idhKQFQAUfhxrtHmkqEn5oUNINRNPFe4JH86BB7u0YqOU9c
 w45j+yMJSJ+gPDarFvVkrbNuvUBnAdLgLQbaq4dDwSebkY2g==
X-Gm-Gg: AZuq6aKA8K0PokwHYQA2vYImCEju+WMv0is1o4LVy3ZtlJ6nGwvmUpY2IdetXul0jkW
 Nr+bPRTGB7v5ZZGNeXOFDnbejEO9uvlDDKQoTSjOU03DTeLnpGHydSXM0c5k9Hf//AoD9jFILlH
 6/Q0KbEZOlPkHuMx8wrpGuv87IlmGCPvQAB+vKBipzAorDj92PUXmA3PABjp1PASrdsd++b1I67
 oLC9dhSaM/7YeBim839QLb7jg==
X-Received: by 2002:a05:7300:80cd:b0:2b7:b4f7:27de with SMTP id
 5a478bee46e88-2b7c925284bmr4461719eec.6.1769965501445; 
 Sun, 01 Feb 2026 09:05:01 -0800 (PST)
X-Received: by 2002:a05:7300:80cd:b0:2b7:b4f7:27de with SMTP id
 5a478bee46e88-2b7c925284bmr4461679eec.6.1769965499371; Sun, 01 Feb 2026
 09:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20260129024919.30449-1-sunliming@linux.dev>
In-Reply-To: <20260129024919.30449-1-sunliming@linux.dev>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 1 Feb 2026 09:04:47 -0800
X-Gm-Features: AZwV_QhaG6j-mnqKY8tq2A7j9WPveVOu600Gi_uLKB_kZmvodRseoGK1TkggHyo
Message-ID: <CACSVV03E23z8M7-RETaeyx04f8sHGZf4gcdUONnwMute1bfqBg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
To: sunliming@linux.dev
Cc: lumag@kernel.org, airlied@gmail.com, simona@ffwll.ch, sean@poorly.run,
 marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: puYIANrMbhwRZQUKqYuXi8-_czt2cjJw
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=697f87bf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=zk_b8o_FbLgx-YkRIm4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDE0NyBTYWx0ZWRfX9Syp1e+R5ykf
 3omr4WKIS8nwXECukIzodd9VjhtMDYgDnvR8UXyRmxQCE7exik5BgUTkTZ9K1PP//s6SamqjKzs
 uF+FX58DczJckyjJpSxuDHN7UiIl0IDEe9KxzFQRj+SmwjLUsBa620Dcw9fKajffZ8HrrdDqgyI
 uMFtvyGYzBq/Kapr4if0dg1Oc94KvEhbFGSxeb3vhi9vtQELtx1nKTNCBTIHDABBZaFOaEq7Wqu
 QxBDEppQO0ZG/X/Bh3L+VEp8X5LEwr7uNnh6tDfC/ZDgk4GTWhWLZCKJE2/P0P78C81MvF+LBHA
 tlIMhJM3X4RV+QVLJBOt3MwT36mU1pL9UGujoMz5pM67HjRef8+w0vpwTHLJv0SvvF8dbN9BZ/1
 RgjF6yysQeYd9V08HJjOsh+gCV0RY2fOm/jNXWM2nIKPWymlUanm3a+zNmEhYPlxH6auhHpmQHZ
 BSiTfT2AywVnwW9xF8w==
X-Proofpoint-GUID: puYIANrMbhwRZQUKqYuXi8-_czt2cjJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_06,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010147
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: F323EC6962
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 6:50=E2=80=AFPM <sunliming@linux.dev> wrote:
>
> From: sunliming <sunliming@kylinos.cn>
>
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_=
config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> index e65f1fc026fd..312ee6597ab1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> @@ -156,11 +156,13 @@ static void dpu_hw_sspp_setup_pe_config_v13(struct =
dpu_hw_sspp *ctx,
>         u8 color;
>         u32 lr_pe[4], tb_pe[4];
>         const u32 bytemask =3D 0xff;
> -       u32 offset =3D ctx->cap->sblk->sspp_rec0_blk.base;
> +       u32 offset;
>
>         if (!ctx || !pe_ext)
>                 return;
>
> +       offset =3D ctx->cap->sblk->sspp_rec0_blk.base;
> +

btw, in this case (and probably most/all such cases in dpu code that
I've looked at) we should probably just remove the impossible null
checks.  (Although the extra indirections in the dpu code make it
harder to see that they are impossible..)

BR,
-R

>         c =3D &ctx->hw;
>         /* program SW pixel extension override for all pipes*/
>         for (color =3D 0; color < DPU_MAX_PLANES; color++) {
> --
> 2.25.1
>
