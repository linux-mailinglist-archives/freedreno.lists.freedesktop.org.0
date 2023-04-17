Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726C6E4EBB
	for <lists+freedreno@lfdr.de>; Mon, 17 Apr 2023 19:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507E610E455;
	Mon, 17 Apr 2023 17:03:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com
 [IPv6:2a00:1450:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EC210E529
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 17:03:13 +0000 (UTC)
Received: by mail-wr1-x44a.google.com with SMTP id
 ffacd0b85a97d-2f446161e5aso990946f8f.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Apr 2023 10:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681750991; x=1684342991;
 h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f9Cl87ka760GG74tR14R00pxajsRRW0jOXtFpoM1jdM=;
 b=46S8fo1VlCUS3sRmNc6OB+mxq1+OpQeAndmrv9g+IwoFiZYYyxeUoaWkiUbCYkLWPs
 e31XNGplfAcVZLjJSspXc6XFp87RztQ/kjsV2aO5h2FiQCF3Muhob8R/WgxaxQrnT+EX
 MrOZNk3aLf02VaPauRyOopcFoeKSptTdQS1KcrlpfpbimZs1MCTL0Fu7nJOHOW9jHZz0
 eVU7JVhubBxWquz+66U5oGp4zYC5ok5YFTcKEn7TjSPbEohOukjYVlEbqJ71iHzelW40
 S/zvAYJuSnM2O8kHlUJlCjbX1BpQGTJ46D81iknmU0K51cvnOCB3aP8i3oUAQzf7I08E
 y5Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681750991; x=1684342991;
 h=to:from:subject:date:message-id:sender:reply-to:mime-version:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f9Cl87ka760GG74tR14R00pxajsRRW0jOXtFpoM1jdM=;
 b=LQsSlEfaxy2PMv8CmBoGQiiQx2dOnJe/A37tOkMmuTxqqMDNGLFACqZsk4h6624KS1
 Kmk47z3cD3a+fdIOoQYuLjN1lSprKK6bLxNi6aDwgGtZ2yt2E/2kCY7R5/xjaXxy8iUq
 FAZYEHjsOSE1igy0S0Dc+twFb12Jvk5c1QZZXXurxY6OdPE9HxWDupyYQS8iG3WQsh2L
 aRlvvMoYpWX80OZzC9VVC9PWQAxI8n1SmXaGXZ9I7JuZbQ3sj1nYJA0gWrvaIubko+Fr
 jJJpq+tIE07dCQKZHlnLg5Gj0twmbVZPqfBTHsGc/T+QMZDUpNRS13Qcg67u5OFQ2Fb9
 +Lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681750991; x=1684342991;
 h=to:from:subject:date:message-id:sender:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f9Cl87ka760GG74tR14R00pxajsRRW0jOXtFpoM1jdM=;
 b=K28uWspT4Ny3E2BynlvD2ONUzq2DZNTk0pfZCETVHku94W4HcrSIN4tK6bHvxCdl+V
 /wc2xq7KR11mw/J3jfFi664JBzQGovvmuuBb/rdJqW4ESXrnuW5mQAu4RQpViK9HtTLe
 IsPbIJIIZEUaZ6XMlS6FgvhTvgkjWLREeDYlaqOh7RlYtwoVajytxYt40rXDc/waOvgp
 4neUHvoj9Ju6ehJ7b25kWDv9kcP3ph8N114CaljxElFgyLx97p+dKg1Z6r1NssoBjVfJ
 IBFh8QJ+NGkIVd31sjpCwKKOtcMx/Mkq+dwT72pcC25D7wJm3EbLkg2a8UEP2GEAorHJ
 LcEA==
X-Gm-Message-State: AAQBX9fEbpwPFiTDB/uWv7l9lzu7MJJfBfjZnzqYjz4EjPfm+AWO6VN4
 fe2WJSUDc19XYQzcKCKpiyFqGu9+AW3yF7CQPCdgeis=
X-Google-Smtp-Source: AKy350YOn+bwpu2stmZluJh05O3tGG+pFNd2nygFPhkrlY9mp2Np4oG+lv2Ded202+Dh30Y/zTpBrzpGpCdnVw8rqt2P
MIME-Version: 1.0
X-Received: by 2002:adf:f306:0:b0:2f9:6c6a:8fa7 with SMTP id
 i6-20020adff306000000b002f96c6a8fa7mr1047843wro.8.1681750991315; Mon, 17 Apr
 2023 10:03:11 -0700 (PDT)
Message-ID: <calendar-df2b5415-4304-4345-946b-f1075b4acf01@google.com>
Date: Mon, 17 Apr 2023 17:03:11 +0000
From: mario.kleiner.de@gmail.com
To: freedreno@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 xorg-devel@lists.freedesktop.org, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 Nouveau Dev <nouveau@lists.freedesktop.org>, board@foundation.x.org, 
 libre-soc-dev@lists.libre-soc.org, 
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, members@x.org,
 droidbittin@gmail.com, wayland-devel@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>, siglesias@igalia.com,
 events@lists.x.org
Content-Type: multipart/mixed; boundary="000000000000702d8505f98b2a94"
Subject: [Freedreno] Invitation: XDC 2023 A Corunha Spain @ Tue Oct 17 - Thu
 Oct 19, 2023 (freedreno@lists.freedesktop.org)
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
Reply-To: mario.kleiner.de@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--000000000000702d8505f98b2a94
Content-Type: multipart/alternative; boundary="000000000000702d8305f98b2a92"

--000000000000702d8305f98b2a92
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

WERDIDIwMjMgQSBDb3J1bmhhIFNwYWluDQpUdWVzZGF5IE9jdCAxNyDigJMgVGh1cnNkYXkgT2N0
IDE5LCAyMDIzDQoNCkpvaW4gd2l0aCBHb29nbGUgTWVldA0KaHR0cHM6Ly9tZWV0Lmdvb2dsZS5j
b20vYXpuLXV3ZnAtcGd3P2hzPTIyNA0KDQoNCg0KDQpIZWxsbyENCg0KUmVnaXN0cmF0aW9uICYg
Q2FsbCBmb3IgUHJvcG9zYWxzIGFyZSBub3cgb3BlbiBmb3IgWERDIDIwMjMsIHdoaWNoIHdpbGwN
CnRha2UgcGxhY2Ugb24gT2N0b2JlciAxNy0xOSwgMjAyMy4NCg0KaHR0cHM6Ly94ZGMyMDIzLngu
b3JnDQoNCkFzIHVzdWFsLCB0aGUgY29uZmVyZW5jZSBpcyBmcmVlIG9mIGNoYXJnZSBhbmQgb3Bl
biB0byB0aGUgZ2VuZXJhbA0KcHVibGljLiBJZiB5b3UgcGxhbiBvbiBhdHRlbmRpbmcsIHBsZWFz
ZSBtYWtlIHN1cmUgdG8gcmVnaXN0ZXIgYXMgZWFybHkNCmFzIHBvc3NpYmxlIQ0KDQpJbiBvcmRl
ciB0byByZWdpc3RlciBhcyBhdHRlbmRlZSwgeW91IHdpbGwgdGhlcmVmb3JlIG5lZWQgdG8gcmVn
aXN0ZXINCnZpYSB0aGUgWERDIHdlYnNpdGUuDQoNCmh0dHBzOi8vaW5kaWNvLmZyZWVkZXNrdG9w
Lm9yZy9ldmVudC80L3JlZ2lzdHJhdGlvbnMvDQoNCkluIGFkZGl0aW9uIHRvIHJlZ2lzdHJhdGlv
biwgdGhlIENmUCBpcyBub3cgb3BlbiBmb3IgdGFsa3MsIHdvcmtzaG9wcw0KYW5kIGRlbW9zIGF0
IFhEQyAyMDIzLiBXaGlsZSAuLi4NCg0KT3JnYW5pemVyDQptYXJpby5rbGVpbmVyLmRlQGdtYWls
LmNvbQ0KbWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20NCg0KR3Vlc3RzDQptYXJpby5rbGVpbmVy
LmRlQGdtYWlsLmNvbSAtIG9yZ2FuaXplcg0KZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CnhvcmctZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQphbWQtZ2Z4IGxpc3QNCmludGVsLWdm
eA0KTm91dmVhdSBEZXYNCmJvYXJkQGZvdW5kYXRpb24ueC5vcmcNCmxpYnJlLXNvYy1kZXZAbGlz
dHMubGlicmUtc29jLm9yZw0KTUwgbWVzYS1kZXYNCm1lbWJlcnNAeC5vcmcNCmZyZWVkcmVub0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCmRyb2lkYml0dGluQGdtYWlsLmNvbQ0Kd2F5bGFuZC1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmRyaS1kZXZlbA0Kc2lnbGVzaWFzQGlnYWxpYS5jb20N
CmV2ZW50c0BsaXN0cy54Lm9yZw0KVmlldyBhbGwgZ3Vlc3QgaW5mbyAgDQpodHRwczovL2NhbGVu
ZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU5qVnhaWFYxWXps
bE1HZHNiREkxZEhFMWNqZGxOakUzY0RnZ1puSmxaV1J5Wlc1dlFHeHBjM1J6TG1aeVpXVmtaWE5y
ZEc5d0xtOXladyZ0b2s9TWpZamJXRnlhVzh1YTJ4bGFXNWxjaTVrWlVCbmJXRnBiQzVqYjIwelpt
VTFNek16WXpZME4yTTVaV1l5TTJZNFpUTTROVFl4TURNeFl6RmpOelppTVdaa016azUmY3R6PUV1
cm9wZSUyRkJlcmxpbiZobD1lbiZlcz0wDQoNClJlcGx5IGZvciBmcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnIGFuZCB2aWV3IG1vcmUgZGV0YWlscyAgDQpodHRwczovL2NhbGVuZGFyLmdv
b2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU5qVnhaWFYxWXpsbE1HZHNi
REkxZEhFMWNqZGxOakUzY0RnZ1puSmxaV1J5Wlc1dlFHeHBjM1J6TG1aeVpXVmtaWE5yZEc5d0xt
OXladyZ0b2s9TWpZamJXRnlhVzh1YTJ4bGFXNWxjaTVrWlVCbmJXRnBiQzVqYjIwelptVTFNek16
WXpZME4yTTVaV1l5TTJZNFpUTTROVFl4TURNeFl6RmpOelppTVdaa016azUmY3R6PUV1cm9wZSUy
RkJlcmxpbiZobD1lbiZlcz0wDQpZb3VyIGF0dGVuZGFuY2UgaXMgb3B0aW9uYWwuDQoNCn5+Ly9+
fg0KSW52aXRhdGlvbiBmcm9tIEdvb2dsZSBDYWxlbmRhcjogaHR0cHM6Ly9jYWxlbmRhci5nb29n
bGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIGVtYWlsIGJlY2F1c2Ug
eW91IGFyZSBhbiBhdHRlbmRlZSBvbiB0aGUgZXZlbnQuIFRvICANCnN0b3AgcmVjZWl2aW5nIGZ1
dHVyZSB1cGRhdGVzIGZvciB0aGlzIGV2ZW50LCBkZWNsaW5lIHRoaXMgZXZlbnQuDQoNCkZvcndh
cmRpbmcgdGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSByZWNpcGllbnQgdG8gc2VuZCBh
IHJlc3BvbnNlIHRvICANCnRoZSBvcmdhbml6ZXIsIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBsaXN0
LCBpbnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3Mgb2YgIA0KdGhlaXIgb3duIGludml0YXRpb24gc3Rh
dHVzLCBvciBtb2RpZnkgeW91ciBSU1ZQLg0KDQpMZWFybiBtb3JlIGh0dHBzOi8vc3VwcG9ydC5n
b29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3YXJkaW5nDQo=
--000000000000702d8305f98b2a92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!doctype html><html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:=
schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:offi=
ce"><head><title></title><!--[if !mso]><meta http-equiv=3D"X-UA-Compatible"=
 content=3D"IE=3Dedge"><![endif]--><meta http-equiv=3D"Content-Type" conten=
t=3D"text/html; charset=3DUTF-8"><meta name=3D"viewport" content=3D"width=
=3Ddevice-width,initial-scale=3D1"><meta name=3D"color-scheme" content=3D"l=
ight dark"><meta name=3D"supported-color-schemes" content=3D"light dark">
    <style>
      body, html {
        font-family: Roboto, Helvetica, Arial, sans-serif;
      }

      body {
        margin: 0;
        padding: 0;
        -webkit-font-smoothing: antialiased;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
      }

      #outlook a {
        padding: 0;
      }

      .ReadMsgBody {
        width: 100%;
      }

      .ExternalClass {
        width: 100%;
      }

      .ExternalClass * {
        line-height: 100%;
      }

      table,
      td {
        mso-table-lspace: 0pt;
        mso-table-rspace: 0pt;
      }

      img {
        border: 0;
        height: auto;
        line-height: 100%;
        outline: none;
        text-decoration: none;
        -ms-interpolation-mode: bicubic;
      }

      p {
        display: block;
        margin: 13px 0;
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      @media only screen and (max-width:580px) {
        @-ms-viewport {
          width: 320px;
        }

        @viewport {
          width: 320px;
        }
      }
    </style>
    <!--<![endif]-->
    <!--[if mso]>
          <xml>
          <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
          </o:OfficeDocumentSettings>
          </xml>
          <![endif]-->
    <!--[if lte mso 11]>
          <style>
            .outlook-group-fix { width:100% !important; }
          </style>
    <![endif]-->

    <!--[if !mso]><!-- -->
  <style>body, html {font-family:Roboto,Helvetica,Arial,sans-serif;}@font-f=
ace {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4mxP.ttf) forma=
t('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Material Icons Extended';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/materialiconsextended/v149/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v130/Gw6kwdfw6UnXLJCcm=
afZyFRXb3BL9rvi0QZG3g.otf) format('opentype');
}

.google-material-icons {
  font-family: 'Google Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Material Icons Filled';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialiconsfilled/v96/WWXFlimHYg6H=
KI3TavMkbKdhBmDvgach8TVpeGsuueSZJH4.otf) format('opentype');
}

.google-material-icons-filled {
  font-family: 'Google Material Icons Filled';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UaGrENHsxJlGDuGo1OIlL3Owps=
.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLU94Yt=
zCwM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLV154t=
zCwM.ttf) format('truetype');
}
</style><!--<![endif]-->
      <style>
        .body-container {
          padding-left: 16px;
          padding-right: 16px;
        }
      </style>
 =20
      <style>
        u+.body .body-container,
        body[data-outlook-cycle] .body-container,
        #MessageViewBody .body-container {
          padding-left: 0;
          padding-right: 0;
        }
      </style>
 =20
    <style>
      @media only screen and (min-width:580px) {
        .column-per-37 {
          width: 37% !important;
          max-width: 37%;
        }

        .column-per-63 {
          width: 63% !important;
          max-width: 63%;
        }
      }
    </style>
 =20
    <style>
      .appointment-buttons th {
        display: block;
        clear: both;
        float: left;
        margin-top: 12px;
      }

      .appointment-buttons th a {
        float: left;
      }

      #MessageViewBody .appointment-buttons th {
       margin-top: 24px;
      }
    </style>
 =20
    <style>
      @media only screen and (max-width:580px) {
        table.full-width-mobile {
          width: 100% !important;
        }

        td.full-width-mobile {
          width: auto !important;
        }
      }
    </style>
    <style>
      .main-container-inner,
      .info-bar-inner {
        padding: 12px 16px !important;
      }

      .main-column-table-ltr {
        padding-right: 0 !important;
      }

      .main-column-table-rtl {
        padding-left: 0 !important;
      }

      @media only screen and (min-width:580px) {
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .main-column-table-ltr {
          padding-right: 32px !important;
        }

        .main-column-table-rtl {
          padding-left: 32px !important;
        }

        .appointment-buttons th {
          display: table-cell;
          clear: none;
        }
      }

      .primary-text {
        color: #3c4043 !important;
      }

      .secondary-text,
      .phone-number a {
        color: #70757a !important;
      }

      .accent-text {
        color: #1a73e8 !important;
      }

      .accent-text-dark {
        color: #185abc !important;
      }

      .grey-button-text,
      .attachment-chip a {
        color: #5f6368 !important;
      }

      .primary-button {
        background-color: #1a73e8 !important;
      }

      .primary-button-text {
        color: #fff !important;
      }

      .underline-on-hover:hover {
        text-decoration: underline !important;
      }

      .grey-infobar-text {
        color: #202124 !important;
      }

      @media (prefers-color-scheme: dark) {
        .primary-text:not([class^=3D"x_"]) {
          color: #e8eaed !important;
        }

        .secondary-text:not([class^=3D"x_"]),
        .phone-number:not([class^=3D"x_"]) a {
          color: #9aa0a6 !important;
        }

        .grey-button-text:not([class^=3D"x_"]),
        .attachment-chip:not([class^=3D"x_"]) a {
          color: #bdc1c6 !important;
        }

        .accent-text:not([class^=3D"x_"]),
        .hairline-button-text:not([class^=3D"x_"]) {
          color: #8ab4f8 !important;
        }

        .primary-button:not([class^=3D"x_"]) {
          background-color: #8ab4f8 !important;
        }

        .primary-button-text:not([class^=3D"x_"]) {
          color: #202124 !important;
        }
      }
    </style>
    <style>
      @media (prefers-color-scheme: dark) {
        .cse-banner:not([class^=3D"x_"]) {
          background-color: #3c4043 !important; /* Google Grey 800 */
        }

        .encryption-icon:not([class^=3D"x_"]) {
          /* WARNING: This causes the whole style tag to get stripped in Gm=
ail. */
          background-image: url('https://fonts.gstatic.com/s/i/googlemateri=
aliconsfilled/encrypted/v3/gm_grey200-24dp/2x/gm_filled_encrypted_gm_grey20=
0_24dp.png') !important;
        }
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      .prevent-link a {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
      }
    </style>
    <!--<![endif]-->

    <!--[if mso | IE]>
      <style>
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .cse-banner .encryption-icon {
          /* We use the IE workaround instead. */
          background-image: none !important;
        }

        .cse-banner .encryption-icon .ms-fallback {
          display: block !important;
        }

        /* NB: Some MS clients ignore dark-scheme styling and apply their o=
wn, so there's nothing we can do to help there. */
        @media (prefers-color-scheme: dark) {
          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback {
            display: none !important;
          }

          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback-da=
rk {
            display: block !important;
          }
        }
      </style>
    <![endif]-->
  </head><body class=3D"body"><span itemscope itemtype=3D"http://schema.org=
/InformAction"><span style=3D"display:none" itemprop=3D"about" itemscope it=
emtype=3D"http://schema.org/Person"><meta itemprop=3D"description" content=
=3D"Invitation from mario.kleiner.de@gmail.com"/></span><span itemprop=3D"o=
bject" itemscope itemtype=3D"http://schema.org/Event"><meta itemprop=3D"eve=
ntStatus" content=3D"http://schema.org/EventScheduled"/><span itemprop=3D"p=
ublisher" itemscope itemtype=3D"http://schema.org/Organization"><meta itemp=
rop=3D"name" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/=
googleCalendar" content=3D"65qeuuc9e0gll25tq5r7e617p8"/><span style=3D"disp=
lay: none; font-size: 1px; color: #fff; line-height: 1px; height: 0; max-he=
ight: 0; width: 0; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D=
"name">XDC 2023 A Corunha Spain</span><meta itemprop=3D"url" content=3D"htt=
ps://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNjVxZXV1Yzl=
lMGdsbDI1dHE1cjdlNjE3cDggZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw&amp;tok=
=3DMjYjbWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20zZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYx=
MDMxYzFjNzZiMWZkMzk5&amp;ctz=3DEurope%2FBerlin&amp;hl=3Den&amp;es=3D0"/><sp=
an aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20231017">=
</time><time itemprop=3D"endDate" datetime=3D"20231020"></time></span><div =
style=3D"display: none; font-size: 1px; color: #fff; line-height: 1px; heig=
ht: 0; max-height: 0; width: 0; max-width: 0; opacity: 0; overflow: hidden;=
">Join with Google Meet =E2=80=93 Hello!
=20
Registration &amp; Call for Proposals are now open for XDC 2023, which will
take place on October 17-19, 2023.

https://xdc2023.x.org
=20
As usual, the conference is free of charge and open to the </div><table bor=
der=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=
=3D"center" style=3D"width:100%;" class=3D"body-container"><tbody><tr><td s=
tyle=3D"" class=3D"" align=3D"left"><!--[if mso | IE]><table border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td height=3D"=
16" style=3D"height:16px;"><![endif]--><div style=3D"height:16px;" aria-hid=
den=3D"true"> &nbsp; </div><!--[if mso | IE]></td></tr></table><![endif]-->=
<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentatio=
n" align=3D"center" style=3D"width:100%;" class=3D""><tbody><tr><td style=
=3D"border: solid 1px #dadce0; border-radius: 8px; direction: rtl; font-siz=
e: 0; padding: 24px 32px; text-align: left; vertical-align: top;" class=3D"=
main-container-inner"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0" role=3D"presentation"><tr><![endif]--><!--[if mso | IE=
]><td class=3D"" style=3D"vertical-align:top;width:37%;" ><![endif]--><div =
class=3D"column-per-37 outlook-group-fix" style=3D"font-size: 13px; text-al=
ign: left; direction: ltr; display: inline-block; vertical-align: top; widt=
h: 100%;overflow: hidden; word-wrap: break-word;"><table border=3D"0" cellp=
adding=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%"><tbody>=
<tr><td style=3D"vertical-align:top;padding:0;"><table border=3D"0" cellpad=
ding=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%"><tr><td s=
tyle=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;=
;padding-bottom:28px;"><a href=3D"https://meet.google.com/azn-uwfp-pgw?hs=
=3D224" class=3D"primary-button-text" style=3D"display: inline-block;font-f=
amily: &#39;Google Sans&#39;, Roboto, sans-serif;font-size: 14px; letter-sp=
acing: 0.25px; line-height: 20px; mso-line-height-rule: exactly; text-decor=
ation: none; text-transform: none; word-wrap: break-word; white-space: nowr=
ap;color: #fff;font-weight: 700;white-space: normal;" target=3D"_blank"><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" =
style=3D"display: inline-block"><tr><td align=3D"center" role=3D"presentati=
on" valign=3D"middle" style=3D"background-color: #1a73e8; cursor: auto; pad=
ding: 10px 25px; border: none; border-radius: 4px; margin: 0;" class=3D"pri=
mary-button"><!--[if mso]><a href=3D"https://meet.google.com/azn-uwfp-pgw?h=
s=3D224" class=3D"primary-button-text" target=3D"_blank"><![endif]--><span =
class=3D"primary-button-text" style=3D"font-family: &#39;Google Sans&#39;, =
Roboto, sans-serif;font-size: 14px; letter-spacing: 0.25px; line-height: 20=
px; mso-line-height-rule: exactly; text-decoration: none; text-transform: n=
one; word-wrap: break-word; white-space: nowrap;color: #fff;font-weight: 70=
0;white-space: normal;">Join with Google Meet</span><!--[if mso]></a><![end=
if]--></td></tr></table></a></td></tr><tr><td style=3D"font-size: 0; paddin=
g: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"><div =
style=3D"font-family: Roboto, sans-serif;font-size: 14px; line-height: 20px=
; mso-line-height-rule: exactly; text-align: left;"><table border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bot=
tom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;colo=
r: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoothing: =
antialiased;margin: 0; padding: 0;">Meeting link</h2></td></tr></table><!--=
 Use grey text for the Meet link--><div><a style=3D"display: inline-block;;=
color: #70757a; text-decoration: none;" class=3D"secondary-text underline-o=
n-hover" href=3D"https://meet.google.com/azn-uwfp-pgw?hs=3D224">meet.google=
.com/azn-uwfp-pgw</a></div></div></td></tr></table></td></tr></tbody></tabl=
e></div><!--[if mso | IE]></td><![endif]--><!--[if mso | IE]><td class=3D""=
 style=3D"vertical-align:top;width:63%;padding-right:32px;" ><![endif]--><d=
iv class=3D"column-per-63 outlook-group-fix" style=3D"font-size: 13px; text=
-align: left; direction: ltr; display: inline-block; vertical-align: top; w=
idth: 100%;overflow: hidden; word-wrap: break-word;"><table border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%" clas=
s=3D"main-column-table-ltr" style=3D"padding-right: 32px; padding-left: 0;;=
table-layout: fixed;"><tbody><tr><td class=3D"main-column-td" style=3D"padd=
ing:0; vertical-align:top;"><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0" role=3D"presentation" width=3D"100%" style=3D"table-layout: fixed;=
"><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: =
break-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-s=
erif;font-style: normal; font-weight: 400; font-size: 14px; line-height: 20=
px; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"=
primary-text" role=3D"presentation"><span>Hello!<br> <br>Registration &amp;=
 Call for Proposals are now open for XDC 2023, which will<br>take place on =
October 17-19, 2023.<p><a href=3D"https://www.google.com/url?q=3Dhttps%3A%2=
F%2Fxdc2023.x.org&amp;sa=3DD&amp;ust=3D1682182980000000&amp;usg=3DAOvVaw1h1=
0087_axdQ594yCVXiA3" target=3D"_blank">https://xdc2023.x.org</a><br> <br>As=
 usual, the conference is free of charge and open to the general<br>public.=
 If you plan on attending, please make sure to register as early<br>as poss=
ible!<br> <br>In order to register as attendee, you will therefore need to =
register<br>via the XDC website.<br> <br><a href=3D"https://www.google.com/=
url?q=3Dhttps%3A%2F%2Findico.freedesktop.org%2Fevent%2F4%2Fregistrations%2F=
&amp;sa=3DD&amp;ust=3D1682182980000000&amp;usg=3DAOvVaw0iSyYS34bFWTmBA9CZoY=
mE" target=3D"_blank">https://indico.freedesktop.org/event/4/registrations/=
</a><br> <br>In addition to registration, the CfP is now open for talks, wo=
rkshops<br>and demos at XDC 2023. While ...</p></span><meta itemprop=3D"des=
cription" content=3D"Hello!
=20
Registration &amp; Call for Proposals are now open for XDC 2023, which will
take place on October 17-19, 2023.

https://xdc2023.x.org
=20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!
=20
In order to register as attendee, you will therefore need to register
via the XDC website.
=20
https://indico.freedesktop.org/event/4/registrations/
=20
In addition to registration, the CfP is now open for talks, workshops
and demos at XDC 2023. While ..."/></div></td></tr><tr><td style=3D"font-si=
ze: 0; padding: 0; text-align: left; word-break: break-word;;padding-bottom=
:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: normal; f=
ont-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;=
color: #3c4043; text-decoration: none;" class=3D"primary-text" role=3D"pres=
entation"><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=
=3D"20231017"></time><time itemprop=3D"endDate" datetime=3D"20231020"></tim=
e></span><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-tex=
t" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weig=
ht: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">When</h=
2></td></tr></table><span>Tuesday Oct 17 =E2=80=93 Thursday Oct 19, 2023</s=
pan></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: =
left; word-break: break-word;;padding-bottom:24px;"><div style=3D"font-fami=
ly: Roboto, sans-serif;font-style: normal; font-weight: 400; font-size: 14p=
x; line-height: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration=
: none;" class=3D"primary-text" role=3D"presentation"><table border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-b=
ottom: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;co=
lor: #3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoothing=
: antialiased;margin: 0; padding: 0;">Guests</h2></td></tr></table><div sty=
le=3D"padding-bottom: 4px; text-align: left;;color: #3c4042;"><div><span it=
emprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span i=
temprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-o=
n-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration: n=
one;" href=3D"mailto:mario.kleiner.de@gmail.com">mario.kleiner.de@gmail.com=
</a></span><meta itemprop=3D"email" content=3D"mario.kleiner.de@gmail.com"/=
></span><span itemprop=3D"organizer" itemscope itemtype=3D"http://schema.or=
g/Person"><meta itemprop=3D"name" content=3D"mario.kleiner.de@gmail.com"/><=
meta itemprop=3D"email" content=3D"mario.kleiner.de@gmail.com"/></span><spa=
n class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"=
> - organizer</span></div><div><span itemprop=3D"attendee" itemscope itemty=
pe=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslat=
e"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bl=
ock;;color: #3c4043; text-decoration: none;" href=3D"mailto:etnaviv@lists.f=
reedesktop.org">etnaviv@lists.freedesktop.org</a></span><meta itemprop=3D"e=
mail" content=3D"etnaviv@lists.freedesktop.org"/></span><span class=3D"seco=
ndary-text" style=3D"color: #70757a; text-decoration: none;"></span></div><=
div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Per=
son"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text=
 underline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-d=
ecoration: none;" href=3D"mailto:xorg-devel@lists.freedesktop.org">xorg-dev=
el@lists.freedesktop.org</a></span><meta itemprop=3D"email" content=3D"xorg=
-devel@lists.freedesktop.org"/></span><span class=3D"secondary-text" style=
=3D"color: #70757a; text-decoration: none;"></span></div><div><span itempro=
p=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itempr=
op=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hov=
er" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;"=
 href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx list</a></span><meta=
 itemprop=3D"email" content=3D"amd-gfx@lists.freedesktop.org"/></span><span=
 class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;">=
</span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://=
schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=
=3D"primary-text underline-on-hover" style=3D"display: inline-block;;color:=
 #3c4043; text-decoration: none;" href=3D"mailto:intel-gfx@lists.freedeskto=
p.org">intel-gfx</a></span><meta itemprop=3D"email" content=3D"intel-gfx@li=
sts.freedesktop.org"/></span><span class=3D"secondary-text" style=3D"color:=
 #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atten=
dee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name=
" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:nouveau@lists.freedesktop.org">Nouveau Dev</a></span><meta itemprop=
=3D"email" content=3D"nouveau@lists.freedesktop.org"/></span><span class=3D=
"secondary-text" style=3D"color: #70757a; text-decoration: none;"></span></=
div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.or=
g/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary=
-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043; t=
ext-decoration: none;" href=3D"mailto:board@foundation.x.org">board@foundat=
ion.x.org</a></span><meta itemprop=3D"email" content=3D"board@foundation.x.=
org"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-d=
ecoration: none;"></span></div><div><span itemprop=3D"attendee" itemscope i=
temtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notra=
nslate"><a class=3D"primary-text underline-on-hover" style=3D"display: inli=
ne-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:libre-soc-=
dev@lists.libre-soc.org">libre-soc-dev@lists.libre-soc.org</a></span><meta =
itemprop=3D"email" content=3D"libre-soc-dev@lists.libre-soc.org"/></span><s=
pan class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none=
;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http=
://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a clas=
s=3D"primary-text underline-on-hover" style=3D"display: inline-block;;color=
: #3c4043; text-decoration: none;" href=3D"mailto:mesa-dev@lists.freedeskto=
p.org">ML mesa-dev</a></span><meta itemprop=3D"email" content=3D"mesa-dev@l=
ists.freedesktop.org"/></span><span class=3D"secondary-text" style=3D"color=
: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atte=
ndee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"nam=
e" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:members@x.org">members@x.org</a></span><meta itemprop=3D"email" cont=
ent=3D"members@x.org"/></span><span class=3D"secondary-text" style=3D"color=
: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"atte=
ndee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"nam=
e" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:freedreno@lists.freedesktop.org">freedreno@lists.freedesktop.org</a>=
</span><meta itemprop=3D"email" content=3D"freedreno@lists.freedesktop.org"=
/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-decor=
ation: none;"></span></div><div><span itemprop=3D"attendee" itemscope itemt=
ype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransla=
te"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-b=
lock;;color: #3c4043; text-decoration: none;" href=3D"mailto:droidbittin@gm=
ail.com">droidbittin@gmail.com</a></span><meta itemprop=3D"email" content=
=3D"droidbittin@gmail.com"/></span><span class=3D"secondary-text" style=3D"=
color: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D=
"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=
=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hover=
" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;" h=
ref=3D"mailto:wayland-devel@lists.freedesktop.org">wayland-devel@lists.free=
desktop.org</a></span><meta itemprop=3D"email" content=3D"wayland-devel@lis=
ts.freedesktop.org"/></span><span class=3D"secondary-text" style=3D"color: =
#70757a; text-decoration: none;"></span></div><div><span itemprop=3D"attend=
ee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name"=
 class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:dri-devel@lists.freedesktop.org">dri-devel</a></span><meta itemprop=
=3D"email" content=3D"dri-devel@lists.freedesktop.org"/></span><span class=
=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"></span=
></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema=
.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"prim=
ary-text underline-on-hover" style=3D"display: inline-block;;color: #3c4043=
; text-decoration: none;" href=3D"mailto:siglesias@igalia.com">siglesias@ig=
alia.com</a></span><meta itemprop=3D"email" content=3D"siglesias@igalia.com=
"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text-deco=
ration: none;"></span></div><div><span itemprop=3D"attendee" itemscope item=
type=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransl=
ate"><a class=3D"primary-text underline-on-hover" style=3D"display: inline-=
block;;color: #3c4043; text-decoration: none;" href=3D"mailto:events@lists.=
x.org">events@lists.x.org</a></span><meta itemprop=3D"email" content=3D"eve=
nts@lists.x.org"/></span><span class=3D"secondary-text" style=3D"color: #70=
757a; text-decoration: none;"></span></div></div><a href=3D"https://calenda=
r.google.com/calendar/event?action=3DVIEW&amp;eid=3DNjVxZXV1YzllMGdsbDI1dHE=
1cjdlNjE3cDggZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw&amp;tok=3DMjYjbWFya=
W8ua2xlaW5lci5kZUBnbWFpbC5jb20zZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYxMDMxYzFjNzZi=
MWZkMzk5&amp;ctz=3DEurope%2FBerlin&amp;hl=3Den&amp;es=3D0" style=3D"display=
: inline-block;;color: #1a73e8; text-decoration: none;font-weight: 700;" ta=
rget=3D"_blank" class=3D"accent-text underline-on-hover">View all guest inf=
o</a></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align:=
 left; word-break: break-word;;padding-bottom:0px;"><div style=3D"color: #3=
c4043; text-decoration: none;;font-family: Roboto, sans-serif;font-size: 14=
px; line-height: 20px; mso-line-height-rule: exactly; text-align: left;" cl=
ass=3D"primary-text"><div><span style=3D"font-weight: 700;-webkit-font-smoo=
thing: antialiased;">Reply</span><span class=3D"secondary-text" style=3D"co=
lor: #70757a; text-decoration: none;"> for <a class=3D"secondary-text under=
line-on-hover" style=3D"display: inline-block;;color: #70757a; text-decorat=
ion: none;" href=3D"mailto:freedreno@lists.freedesktop.org">freedreno@lists=
.freedesktop.org</a></span></div></div></td></tr><tr><td style=3D"font-size=
: 0; padding: 0; text-align: left; word-break: break-word;;padding-bottom:1=
6px;"><div style=3D"font-family: Roboto, sans-serif;font-size: 14px; line-h=
eight: 20px; mso-line-height-rule: exactly; text-align: left;"><table borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"=
border-collapse: separate;"><tr><td style=3D"padding-top: 8px; padding-left=
: 0; padding-right: 12px;"><!-- RSVP buttons --><table border=3D"0" cellpad=
ding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border: solid 1=
px #dadce0; border-radius: 16px; border-collapse: separate;font-family: &#3=
9;Google Sans&#39;, Roboto, sans-serif;;display: inline-block;;margin-right=
: 12px; margin-left: 0;"><tr><td align=3D"center" vertical-align=3D"middle"=
 role=3D"presentation"><span itemprop=3D"potentialaction" itemscope itemtyp=
e=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D=
"http://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscop=
e itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method=
" href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color: #=
5f6367;"><a href=3D"https://calendar.google.com/calendar/event?action=3DRES=
POND&amp;eid=3DNjVxZXV1YzllMGdsbDI1dHE1cjdlNjE3cDggZnJlZWRyZW5vQGxpc3RzLmZy=
ZWVkZXNrdG9wLm9yZw&amp;rst=3D1&amp;tok=3DMjYjbWFyaW8ua2xlaW5lci5kZUBnbWFpbC=
5jb20zZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYxMDMxYzFjNzZiMWZkMzk5&amp;ctz=3DEurope=
%2FBerlin&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#=
39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; li=
ne-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration:=
 none; text-transform: none;" class=3D"grey-button-text" itemprop=3D"url" t=
arget=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" ro=
le=3D"presentation"><tr><td align=3D"center" role=3D"presentation" valign=
=3D"middle" style=3D"padding: 6px 0; padding-left: 16px; padding-right: 12p=
x; white-space: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.co=
m/calendar/event?action=3DRESPOND&amp;eid=3DNjVxZXV1YzllMGdsbDI1dHE1cjdlNjE=
3cDggZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw&amp;rst=3D1&amp;tok=3DMjYjb=
WFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20zZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYxMDMxYzFj=
NzZiMWZkMzk5&amp;ctz=3DEurope%2FBerlin&amp;hl=3Den&amp;es=3D0" class=3D"gre=
y-button-text" itemprop=3D"url" target=3D"_blank"><![endif]--><span class=
=3D"grey-button-text" style=3D"font-weight: 400;font-family: &#39;Google Sa=
ns&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 1=
20%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-=
transform: none;">Yes</span><!--[if mso]></a><![endif]--></td></tr></table>=
</a></span></span></span></td><td align=3D"center" vertical-align=3D"middle=
" role=3D"presentation" style=3D"border-left: solid 1px #dadce0; border-rig=
ht: solid 1px #dadce0;"><span itemprop=3D"potentialaction" itemscope itemty=
pe=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=
=3D"http://schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" itemsc=
ope itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"meth=
od" href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color:=
 #5f6367;"><a href=3D"https://calendar.google.com/calendar/event?action=3DR=
ESPOND&amp;eid=3DNjVxZXV1YzllMGdsbDI1dHE1cjdlNjE3cDggZnJlZWRyZW5vQGxpc3RzLm=
ZyZWVkZXNrdG9wLm9yZw&amp;rst=3D2&amp;tok=3DMjYjbWFyaW8ua2xlaW5lci5kZUBnbWFp=
bC5jb20zZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYxMDMxYzFjNzZiMWZkMzk5&amp;ctz=3DEuro=
pe%2FBerlin&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: =
&#39;Google Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; =
line-height: 120%; mso-line-height-rule: exactly; margin: 0; text-decoratio=
n: none; text-transform: none;" class=3D"grey-button-text" itemprop=3D"url"=
 target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
role=3D"presentation"><tr><td align=3D"center" role=3D"presentation" valign=
=3D"middle" style=3D"padding: 6px 12px; white-space: nowrap;"><!--[if mso]>=
<a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;=
eid=3DNjVxZXV1YzllMGdsbDI1dHE1cjdlNjE3cDggZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrd=
G9wLm9yZw&amp;rst=3D2&amp;tok=3DMjYjbWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20zZmU=
1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYxMDMxYzFjNzZiMWZkMzk5&amp;ctz=3DEurope%2FBerlin=
&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=
=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-weig=
ht: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f63=
68; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; marg=
in: 0; text-decoration: none; text-transform: none;">No</span><!--[if mso]>=
</a><![endif]--></td></tr></table></a></span></span></span></td><td align=
=3D"center" vertical-align=3D"middle" role=3D"presentation"><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/May=
be"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/Htt=
pActionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReq=
uestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calenda=
r.google.com/calendar/event?action=3DRESPOND&amp;eid=3DNjVxZXV1YzllMGdsbDI1=
dHE1cjdlNjE3cDggZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw&amp;rst=3D3&amp;=
tok=3DMjYjbWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20zZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4N=
TYxMDMxYzFjNzZiMWZkMzk5&amp;ctz=3DEurope%2FBerlin&amp;hl=3Den&amp;es=3D0" s=
tyle=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-s=
erif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-ru=
le: exactly; margin: 0; text-decoration: none; text-transform: none;" class=
=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0=
" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=
=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padding: 6px 0=
; padding-left: 12px; padding-right: 16px; white-space: nowrap;"><!--[if ms=
o]><a href=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&a=
mp;eid=3DNjVxZXV1YzllMGdsbDI1dHE1cjdlNjE3cDggZnJlZWRyZW5vQGxpc3RzLmZyZWVkZX=
NrdG9wLm9yZw&amp;rst=3D3&amp;tok=3DMjYjbWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20z=
ZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYxMDMxYzFjNzZiMWZkMzk5&amp;ctz=3DEurope%2FBer=
lin&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" tar=
get=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-w=
eight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5=
f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; m=
argin: 0; text-decoration: none; text-transform: none;">Maybe</span><!--[if=
 mso]></a><![endif]--></td></tr></table></a></span></span></span></td></tr>=
</table><!-- More options --><a href=3D"https://calendar.google.com/calenda=
r/event?action=3DVIEW&amp;eid=3DNjVxZXV1YzllMGdsbDI1dHE1cjdlNjE3cDggZnJlZWR=
yZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw&amp;tok=3DMjYjbWFyaW8ua2xlaW5lci5kZUBnb=
WFpbC5jb20zZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYxMDMxYzFjNzZiMWZkMzk5&amp;ctz=3DE=
urope%2FBerlin&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font=
-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: =
#5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly;=
 margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-but=
ton-text" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-r=
adius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, =
Roboto, sans-serif;"><tr><td align=3D"center" vertical-align=3D"middle" rol=
e=3D"presentation" style=3D"padding: 6px 0; padding-left: 16px; padding-rig=
ht: 12px; white-space: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"htt=
ps://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNjVxZXV1Yzl=
lMGdsbDI1dHE1cjdlNjE3cDggZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw&amp;tok=
=3DMjYjbWFyaW8ua2xlaW5lci5kZUBnbWFpbC5jb20zZmU1MzMzYzY0N2M5ZWYyM2Y4ZTM4NTYx=
MDMxYzFjNzZiMWZkMzk5&amp;ctz=3DEurope%2FBerlin&amp;hl=3Den&amp;es=3D0" clas=
s=3D"grey-button-text" target=3D"_blank"><![endif]--><span class=3D"grey-bu=
tton-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Ro=
boto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-li=
ne-height-rule: exactly; margin: 0; text-decoration: none; text-transform: =
none;">More options</span><!--[if mso]></a><![endif]--></td></tr></table></=
a></td></tr></table></div></td></tr></table></td></tr></tbody></table></div=
><!--[if mso | IE]></td><![endif]--><!--[if mso | IE]></tr></table><![endif=
]--></td></tr></tbody></table><table border=3D"0" cellpadding=3D"0" cellspa=
cing=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%;" cla=
ss=3D""><tbody><tr><td style=3D"font-size: 0; padding: 0; text-align: left;=
 word-break: break-word;;padding:4px 12px;" class=3D"" align=3D"left"><div =
class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;fon=
t-family: Roboto, sans-serif;font-size: 12px; line-height: 16px; mso-line-h=
eight-rule: exactly; text-align: left;"><p>Invitation from <a href=3D"https=
://calendar.google.com/calendar/" class=3D"accent-text underline-on-hover" =
style=3D"font-family: Roboto, sans-serif;font-size: 12px; line-height: 16px=
; mso-line-height-rule: exactly;;color: #1a73e8; text-decoration: none;" ta=
rget=3D"_blank">Google Calendar</a></p><p>You are receiving this email beca=
use you are an attendee on the event. To stop receiving future updates for =
this event, decline this event.</p><p>Forwarding this invitation could allo=
w any recipient to send a response to the organizer, be added to the guest =
list, invite others regardless of their own invitation status, or modify yo=
ur RSVP. <a class=3D"accent-text underline-on-hover" style=3D"font-family: =
Roboto, sans-serif;font-size: 12px; line-height: 16px; mso-line-height-rule=
: exactly;;color: #1a73e8; text-decoration: none;" href=3D"https://support.=
google.com/calendar/answer/37135#forwarding">Learn more</a></p></div></td><=
/tr></tbody></table></td></tr></tbody></table></span></span></body></html>
--000000000000702d8305f98b2a92
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART;VALUE=DATE:20231017
DTEND;VALUE=DATE:20231020
DTSTAMP:20230417T170311Z
ORGANIZER;CN=mario.kleiner.de@gmail.com:mailto:mario.kleiner.de@gmail.com
UID:65qeuuc9e0gll25tq5r7e617p8@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=etnaviv@lists.freedesktop.org;X-NUM-GUESTS=0:mailto:etnaviv@lists.f
 reedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=xorg-devel@lists.freedesktop.org;X-NUM-GUESTS=0:mailto:xorg-devel@l
 ists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=amd-gfx list;X-NUM-GUESTS=0:mailto:amd-gfx@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=intel-gfx;X-NUM-GUESTS=0:mailto:intel-gfx@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=Nouveau Dev;X-NUM-GUESTS=0:mailto:nouveau@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=mario.kleiner.de@gmail.com;X-NUM-GUESTS=0:mailto:mario.kleiner.de@gmail
 .com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=board@foundation.x.org;X-NUM-GUESTS=0:mailto:board@foundation.x.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=libre-soc-dev@lists.libre-soc.org;X-NUM-GUESTS=0:mailto:libre-soc-d
 ev@lists.libre-soc.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=ML mesa-dev;X-NUM-GUESTS=0:mailto:mesa-dev@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=members@x.org;X-NUM-GUESTS=0:mailto:members@x.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=freedreno@lists.freedesktop.org;X-NUM-GUESTS=0:mailto:freedreno@lis
 ts.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=droidbittin@gmail.com;X-NUM-GUESTS=0:mailto:droidbittin@gmail.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=wayland-devel@lists.freedesktop.org;X-NUM-GUESTS=0:mailto:wayland-d
 evel@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=dri-devel;X-NUM-GUESTS=0:mailto:dri-devel@lists.freedesktop.org
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=siglesias@igalia.com;X-NUM-GUESTS=0:mailto:siglesias@igalia.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=events@lists.x.org;X-NUM-GUESTS=0:mailto:events@lists.x.org
X-GOOGLE-CONFERENCE:https://meet.google.com/azn-uwfp-pgw
X-MICROSOFT-CDO-OWNERAPPTID:1506379394
CREATED:20230417T170310Z
DESCRIPTION:Hello!\n \nRegistration & Call for Proposals are now open for X
 DC 2023\, which will\ntake place on October 17-19\, 2023.\n\nhttps://xdc202
 3.x.org\n \nAs usual\, the conference is free of charge and open to the gen
 eral\npublic. If you plan on attending\, please make sure to register as ea
 rly\nas possible!\n \nIn order to register as attendee\, you will therefore
  need to register\nvia the XDC website.\n \nhttps://indico.freedesktop.org/
 event/4/registrations/\n \nIn addition to registration\, the CfP is now ope
 n for talks\, workshops\nand demos at XDC 2023. While ...\n\n-::~:~::~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\n
 Join with Google Meet: https://meet.google.com/azn-uwfp-pgw\n\nLearn more a
 bout Meet at: https://support.google.com/a/users/answer/9282720\n\nPlease d
 o not edit this section.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20230417T170310Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:XDC 2023 A Corunha Spain
TRANSP:TRANSPARENT
BEGIN:VALARM
ACTION:EMAIL
DESCRIPTION:This is an event reminder
SUMMARY:Alarm notification
ATTENDEE:mailto:freedreno@lists.freedesktop.org
TRIGGER:-P0DT0H30M0S
END:VALARM
BEGIN:VALARM
ACTION:DISPLAY
DESCRIPTION:This is an event reminder
TRIGGER:-P0DT0H30M0S
END:VALARM
BEGIN:VALARM
ACTION:EMAIL
DESCRIPTION:This is an event reminder
SUMMARY:Alarm notification
ATTENDEE:mailto:freedreno@lists.freedesktop.org
TRIGGER:-P0DT7H30M0S
END:VALARM
END:VEVENT
END:VCALENDAR

--000000000000702d8305f98b2a92--

--000000000000702d8505f98b2a94
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUO1ZBTFVFPURBVEU6MjAyMzEwMTcNCkRURU5EO1ZBTFVF
PURBVEU6MjAyMzEwMjANCkRUU1RBTVA6MjAyMzA0MTdUMTcwMzExWg0KT1JHQU5JWkVSO0NOPW1h
cmlvLmtsZWluZXIuZGVAZ21haWwuY29tOm1haWx0bzptYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNv
bQ0KVUlEOjY1cWV1dWM5ZTBnbGwyNXRxNXI3ZTYxN3A4QGdvb2dsZS5jb20NCkFUVEVOREVFO0NV
VFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElP
TjtSU1ZQPQ0KIFRSVUU7Q049ZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7WC1OVU0tR1VF
U1RTPTA6bWFpbHRvOmV0bmF2aXZAbGlzdHMuZg0KIHJlZWRlc2t0b3Aub3JnDQpBVFRFTkRFRTtD
VVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJ
T047UlNWUD0NCiBUUlVFO0NOPXhvcmctZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnO1gtTlVN
LUdVRVNUUz0wOm1haWx0bzp4b3JnLWRldmVsQGwNCiBpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQVRU
RU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVF
RFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1hbWQtZ2Z4IGxpc3Q7WC1OVU0tR1VFU1RTPTA6bWFp
bHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJ
RFVBTDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBU
UlVFO0NOPWludGVsLWdmeDtYLU5VTS1HVUVTVFM9MDptYWlsdG86aW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElD
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1Ob3V2ZWF1IERldjtY
LU5VTS1HVUVTVFM9MDptYWlsdG86bm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkFUVEVO
REVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPUFDQ0VQ
VEVEO1JTVlA9VFJVRQ0KIDtDTj1tYXJpby5rbGVpbmVyLmRlQGdtYWlsLmNvbTtYLU5VTS1HVUVT
VFM9MDptYWlsdG86bWFyaW8ua2xlaW5lci5kZUBnbWFpbA0KIC5jb20NCkFUVEVOREVFO0NVVFlQ
RT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtS
U1ZQPQ0KIFRSVUU7Q049Ym9hcmRAZm91bmRhdGlvbi54Lm9yZztYLU5VTS1HVUVTVFM9MDptYWls
dG86Ym9hcmRAZm91bmRhdGlvbi54Lm9yZw0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9M
RT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1s
aWJyZS1zb2MtZGV2QGxpc3RzLmxpYnJlLXNvYy5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmxp
YnJlLXNvYy1kDQogZXZAbGlzdHMubGlicmUtc29jLm9yZw0KQVRURU5ERUU7Q1VUWVBFPUlORElW
SURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQog
VFJVRTtDTj1NTCBtZXNhLWRldjtYLU5VTS1HVUVTVFM9MDptYWlsdG86bWVzYS1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPW1lbWJlcnNAeC5v
cmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOm1lbWJlcnNAeC5vcmcNCkFUVEVOREVFO0NVVFlQRT1J
TkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQ
PQ0KIFRSVUU7Q049ZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZztYLU5VTS1HVUVTVFM9
MDptYWlsdG86ZnJlZWRyZW5vQGxpcw0KIHRzLmZyZWVkZXNrdG9wLm9yZw0KQVRURU5ERUU7Q1VU
WVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9DQogVFJVRTtDTj1kcm9pZGJpdHRpbkBnbWFpbC5jb207WC1OVU0tR1VFU1RTPTA6bWFp
bHRvOmRyb2lkYml0dGluQGdtYWlsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9M
RT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj13
YXlsYW5kLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZztYLU5VTS1HVUVTVFM9MDptYWlsdG86
d2F5bGFuZC1kDQogZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkFUVEVOREVFO0NVVFlQRT1J
TkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQ
PQ0KIFRSVUU7Q049ZHJpLWRldmVsO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1Q
QVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPXNpZ2xlc2lh
c0BpZ2FsaWEuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpzaWdsZXNpYXNAaWdhbGlhLmNvbQ0K
QVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9
TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1ldmVudHNAbGlzdHMueC5vcmc7WC1OVU0tR1VF
U1RTPTA6bWFpbHRvOmV2ZW50c0BsaXN0cy54Lm9yZw0KWC1HT09HTEUtQ09ORkVSRU5DRTpodHRw
czovL21lZXQuZ29vZ2xlLmNvbS9hem4tdXdmcC1wZ3cNClgtTUlDUk9TT0ZULUNETy1PV05FUkFQ
UFRJRDoxNTA2Mzc5Mzk0DQpDUkVBVEVEOjIwMjMwNDE3VDE3MDMxMFoNCkRFU0NSSVBUSU9OOkhl
bGxvIVxuIFxuUmVnaXN0cmF0aW9uICYgQ2FsbCBmb3IgUHJvcG9zYWxzIGFyZSBub3cgb3BlbiBm
b3IgWA0KIERDIDIwMjNcLCB3aGljaCB3aWxsXG50YWtlIHBsYWNlIG9uIE9jdG9iZXIgMTctMTlc
LCAyMDIzLlxuXG5odHRwczovL3hkYzIwMg0KIDMueC5vcmdcbiBcbkFzIHVzdWFsXCwgdGhlIGNv
bmZlcmVuY2UgaXMgZnJlZSBvZiBjaGFyZ2UgYW5kIG9wZW4gdG8gdGhlIGdlbg0KIGVyYWxcbnB1
YmxpYy4gSWYgeW91IHBsYW4gb24gYXR0ZW5kaW5nXCwgcGxlYXNlIG1ha2Ugc3VyZSB0byByZWdp
c3RlciBhcyBlYQ0KIHJseVxuYXMgcG9zc2libGUhXG4gXG5JbiBvcmRlciB0byByZWdpc3RlciBh
cyBhdHRlbmRlZVwsIHlvdSB3aWxsIHRoZXJlZm9yZQ0KICBuZWVkIHRvIHJlZ2lzdGVyXG52aWEg
dGhlIFhEQyB3ZWJzaXRlLlxuIFxuaHR0cHM6Ly9pbmRpY28uZnJlZWRlc2t0b3Aub3JnLw0KIGV2
ZW50LzQvcmVnaXN0cmF0aW9ucy9cbiBcbkluIGFkZGl0aW9uIHRvIHJlZ2lzdHJhdGlvblwsIHRo
ZSBDZlAgaXMgbm93IG9wZQ0KIG4gZm9yIHRhbGtzXCwgd29ya3Nob3BzXG5hbmQgZGVtb3MgYXQg
WERDIDIwMjMuIFdoaWxlIC4uLlxuXG4tOjp+On46On46fjp+Og0KIH46fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Ojp+On46Oi1c
bg0KIEpvaW4gd2l0aCBHb29nbGUgTWVldDogaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vYXpuLXV3
ZnAtcGd3XG5cbkxlYXJuIG1vcmUgYQ0KIGJvdXQgTWVldCBhdDogaHR0cHM6Ly9zdXBwb3J0Lmdv
b2dsZS5jb20vYS91c2Vycy9hbnN3ZXIvOTI4MjcyMFxuXG5QbGVhc2UgZA0KIG8gbm90IGVkaXQg
dGhpcyBzZWN0aW9uLlxuLTo6fjp+Ojp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjp+On46fg0KIDp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjo6fjp+OjotDQpMQVNULU1P
RElGSUVEOjIwMjMwNDE3VDE3MDMxMFoNCkxPQ0FUSU9OOg0KU0VRVUVOQ0U6MA0KU1RBVFVTOkNP
TkZJUk1FRA0KU1VNTUFSWTpYREMgMjAyMyBBIENvcnVuaGEgU3BhaW4NClRSQU5TUDpUUkFOU1BB
UkVOVA0KQkVHSU46VkFMQVJNDQpBQ1RJT046RU1BSUwNCkRFU0NSSVBUSU9OOlRoaXMgaXMgYW4g
ZXZlbnQgcmVtaW5kZXINClNVTU1BUlk6QWxhcm0gbm90aWZpY2F0aW9uDQpBVFRFTkRFRTptYWls
dG86ZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KVFJJR0dFUjotUDBEVDBIMzBNMFMN
CkVORDpWQUxBUk0NCkJFR0lOOlZBTEFSTQ0KQUNUSU9OOkRJU1BMQVkNCkRFU0NSSVBUSU9OOlRo
aXMgaXMgYW4gZXZlbnQgcmVtaW5kZXINClRSSUdHRVI6LVAwRFQwSDMwTTBTDQpFTkQ6VkFMQVJN
DQpCRUdJTjpWQUxBUk0NCkFDVElPTjpFTUFJTA0KREVTQ1JJUFRJT046VGhpcyBpcyBhbiBldmVu
dCByZW1pbmRlcg0KU1VNTUFSWTpBbGFybSBub3RpZmljYXRpb24NCkFUVEVOREVFOm1haWx0bzpm
cmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpUUklHR0VSOi1QMERUN0gzME0wUw0KRU5E
OlZBTEFSTQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K
--000000000000702d8505f98b2a94--
